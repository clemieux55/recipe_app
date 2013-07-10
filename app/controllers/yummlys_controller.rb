class YummlysController < ApplicationController


	def new
	end

	def index
		if params[:yummly]
			yummly = Yummly.new(params[:yummly][:yum])
			@recipes = yummly.recipes
		end
	end
end