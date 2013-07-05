class RecipeIngredientsController < ApplicationController
	def new
	end
	def create
		@recipe = Recipe.find(params[:recipe_id])
		recipe_ingredient = @recipe.recipe_ingredients.new(params[:recipe_ingredient])
		if recipe_ingredient.save
			redirect_to edit_recipe_path(@recipe)
		else
			flash[:error] = 'Recipe not Created!'
			redirect_to edit_recipe_path(@recipe)
			
		end
	end

end
