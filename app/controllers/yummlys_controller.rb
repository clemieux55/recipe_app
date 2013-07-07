class YummlysController < ApplicationController

	def new
		@yummly = Yummly.new(params[:q])

	end




end