class Recipe < ActiveRecord::Base
  attr_accessible :author, :title
  validates_presence_of :title, :description, {:maximun => 500}
  has_many :ingredients, :through => :recipe_ingredients
  has_many :recipe_ingredients


end
