require 'pry'

class RecipesController < ApplicationController
  before_filter :authenticate_user!

	def new
    @comment = Comment.new
		@recipe = Recipe.new
		unless user_signed_in?
			flash[:notice] = 'You need to sign in or sign up before continuing.'
		end
    @recipe_ingredient = RecipeIngredient.new
	end

  def index
    @recipes = search.result
  end

  def create
    @comment = Comment.new(params[:comment])
  	@recipe = Recipe.new(params[:recipe])
  	if @recipe.save == true
  		flash[:notice] = 'Recipe Successfully Created'
      redirect_to recipe_path(@recipe)
  	else
  		flash[:notice] = 'Please fill in appropriate fields'
      render action: "new"
  	end
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end

end
