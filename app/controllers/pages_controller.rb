class PagesController < ApplicationController
  

	def index
		@recipes = Recipe.last(3)
	end

	def new
		@user = User.new(params[:user])
	end

end