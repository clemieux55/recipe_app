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
    @recipe.user = current_user
    if @recipe.save
      flash[:notice] = 'Recipe Successfully Created'
      redirect_to edit_recipe_path(@recipe)
    else
      flash[:notice] = 'Please fill in appropriate fields'
      render 'new'
    end
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_ingredient = @recipe.recipe_ingredients.new
  end

end
