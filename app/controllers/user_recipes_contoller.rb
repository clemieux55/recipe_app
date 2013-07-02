class UserRecipesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes
    render "recipes/index"
  end



end
