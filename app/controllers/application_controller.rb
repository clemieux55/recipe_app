class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :search

	def index
  	@search = Recipe.search(params[:q])
	end

	def search
  	@search = Recipe.search(params[:q])
	end
end
