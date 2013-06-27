class IngredientsController < ApplicationController


	def index
		@search = Ingredient.search(params[:q])
		@ingredients = @search.result(:exact => true)
		@search.build_condition if @search.conditions.empty?
		@search.build_sort if @search.sorts.empty?
	end

	def new
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.find(params[:id])
		@recipe_ingredient = RecipeIngredient.ingredient.build(params[:ingredient])

	end

	def show
		@ingredient = Ingredient.find(params[:id])
	end

end
