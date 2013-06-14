class RecipeIngredientsController < ApplicationController

	def index
		@recipe_ingredients = RecipeIngredient.all
	end

	def new
		@recipe_ingredient = RecipeIngredient.new
	end
end
