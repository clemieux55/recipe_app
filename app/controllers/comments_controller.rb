class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@comments = Comment.all
	end

	def new
		@comment = Comment.new(params[:comment])
	end

	def create
		@comment = Comment.new(params[:recipe_id])
		binding.pry
		if @comment.save
			flash[:notice] = 'Comment added'
		else
			flash[:notice] = 'Comment not added'
		end
	end
	
	def show 
		@comment = Comment.find(params[:id])
	end

end
