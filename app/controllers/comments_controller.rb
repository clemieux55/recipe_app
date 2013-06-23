class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@comments = Comment.all
	end


end
