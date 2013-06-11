class Recipe < ActiveRecord::Base
  attr_accessible :author, :recipe_id, :title
  validates_presence_of :author, :recipe_id, :title
end
