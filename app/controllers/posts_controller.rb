class PostsController < ApplicationController

	before_action :logged_in_user, only: [:new, :create]

  def new
  	@user = current_user
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		@post.update_attribute(:author, author_param)
  		flash[:success] = "You just created a new post"
  		redirect_to posts_url
  	else
  		flash.now[:danger] = "We could not create a new post"
  		render "new"
  	end
  end

  def index
  	@posts = Post.all
  end

  private

  	def logged_in_user
  		unless logged_in?
  			flash[:danger] = "You must be a Member to do that!"
  			redirect_to root_url
  		end
  	end

  	def post_params
  		params.require(:post).permit(:title, :body)
  	end

  	def author_param
  		params.permit(:author)[:author]
  	end
end
