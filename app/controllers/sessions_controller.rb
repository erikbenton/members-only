class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		log_in @user
  		remember(@user)
  		flash[:success] = "You have successfully logged in"
  		redirect_to root_url
  	else
  		flash[:danger] = "Invalid email and/or password"
  		render "new"
  	end

  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
