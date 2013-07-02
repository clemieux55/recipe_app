class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@comments = Comment.all
	end

	def new
		@comment = Comment.new(params[:comment])
	end

	def create
		@recipe = Recipe.find(params[:recipe_id])
		@comment = @recipe.comments.build(params[:comment])
		@comment.user = current_user
		if @comment.save == true
			flash[:notice] = 'Comment Added'
			redirect_to(@recipe)
		else
			flash[:notice] = 'Comment not added'
			redirect_to(@recipe)
		end
	end
	
	def show 
		@comment = Comment.find(params[:id])
	end

end
