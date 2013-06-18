class RecipesController < ApplicationController
  
	def new
		@recipe = Recipe.new
		unless user_signed_in?
			flash[:notice] = 'You must register to create recipe!'
		end
	end

  def index
  	@recipes = Recipe.all
  end

  def create
  	@recipe = Recipe.new(params[:recipe])
  	if @recipe.save 
  		redirect_to ingredients_path
  		flash[:notice] = 'Now choose the ingredients'
  	else
  		flash[:notice] = 'Please fill in appropriate fields'
  	end
  end
  
end
