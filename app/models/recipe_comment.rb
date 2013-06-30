class RecipeComment < ActiveRecord::Base
	attr_accessible :comment_id, :recipe_id
	belongs_to :recipe
	belongs_to :user
	has_many :comments
	has_many :recipes
	validates_presence_of :recipe_id
	validates_presence_of :comment_id


end
