class User < ApplicationRecord

	attr_accessor :remember_token

	# Before saving a user
	before_save :downcase_email

	# Before creating a user
	before_save :remember

	# Validating user attributes
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(string)
		Digest::SHA1.hexdigest(string)
	end

	def remember
		self.remember_token = User.new_token
		self.remember_digest = User.digest(remember_token.to_s)
	end

	private
		def downcase_email
			email.downcase!
		end
end
