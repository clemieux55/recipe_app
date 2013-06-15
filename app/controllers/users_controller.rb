class UsersController < ApplicationController
	helper_method :current_user, :logged_in?

	def index
		@users = Users.all
	end

	def new
		@user = User.new
		if @user.save
			redirect_to user_session_path
		else
			flash[:notice] = 'Username not found!'
		end
	end

	def log_in
		@user = User.find(params[:email, :password])
		if @user.exist?
			flash[:notice] = "Successfully logged in!"
		else
			root_path
		end
	end

	def show
		@user = User.find(params[:id])

	end

	def create 
		@user = User.new(params[:users])
			if @user.save?
			  redirect_to @user, :notice => 'User successfully created!'
			else 
				render action: "edit"
		end
	end													
end
