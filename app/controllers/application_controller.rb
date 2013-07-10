class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :search

	def index
		@yummly = Yummly.new(params[:q])
		redirect_to yummlys_path
  	@search = Recipe.search(params[:q])
	end

	def search
  	@search = Recipe.search(params[:q])
	end


end
