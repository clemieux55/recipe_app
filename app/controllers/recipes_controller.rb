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
  	if @recipe.save 
  		flash[:notice] = 'Recipe Successfully Created'
      redirect_to recipe_path(@recipe)
  	else
  		flash[:notice] = 'Please fill in appropriate fields'
      render action: "new"
  	end
  end
  
  def show
    @recipe = Recipe.find(params[:id])

  end

end
