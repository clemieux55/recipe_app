class RecipesController < ApplicationController
  
	def new
		@recipe = Recipe.new
		unless user_signed_in?
			flash[:notice] = 'You must register to create recipe!'
		end
    @recipe_ingredient = RecipeIngredient.new
	end

  def index
  	@recipes = Recipe.all
  end

  def create
  	@recipe = Recipe.new(params[:recipe])
    redirect_to ingredients_path
  	if @recipe.save 
  		flash[:notice] = 'Now choose the ingredients'
  	else
  		flash[:notice] = 'Please fill in appropriate fields'
  	end
  end
  
end
