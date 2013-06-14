class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(params[:recipe])

    if @recipe.save
      redirect_to @recipe
      flash[:notice] = 'Recipe Successfully Created!'
    else
      render "new"
    end
  end

  def destroy
  end

  def new
    if user_signed_in?
      @recipe = Recipe.new
        6.times do 
        @recipe.ingredients.build
      end
    else
      redirect_to root_path
      flash[:notice] = "You must register to create recipe!"
    end
  end

  def edit
  end

  def update
  end
end
