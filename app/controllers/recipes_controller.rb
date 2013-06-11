class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe = Recipe.new
    if @recipe.save
      redirect_to recipe_path_id
      flash[:notice] = 'Recipe Successfully Created!'
    else
      render "new"
    end
  end

  def destroy
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def update
  end
end
