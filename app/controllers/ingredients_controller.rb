class IngredientsController < ApplicationController

	def index 
		@ingredients = Ingredient.all

	end

	def create 
		@ingredient = Ingredient.new
		if @ingredient.save
			@recipe
		else
			flash[:notice] = 'Recipe not saved!'

		end
	end 

	def new 
		@ingredient = Ingredient.new
	end

	def show
		@ingredient = Ingredient.find(params[:id])
	end


end
