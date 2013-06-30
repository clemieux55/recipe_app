class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@comments = Comment.all
	end

	def new
		@comment = Comment.new(params[:comment])
	end

	def create
		@commentable = Recipe.find(params[:id])
		@comment = @commentable.comments.build(params[:comment])
		if @comment.save
			flash[:notice] = 'Comment added'
			redirect_to(recipe)
		else
			flash[:notice] = 'Comment not added'
			render :action => "new"
		end
	end
	
	def show 
		@comment = Comment.find(params[:id])
	end

end
