class UsersController < ApplicationController

	def index
		@users = User.all
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


	end

end
