class Ingredient < ActiveRecord::Base
  attr_accessible :name, :ingredient_attributes
  validates_presence_of :name, :null => false
  has_many :recipe_ingredients
  has_many :recipes, 
  	:through => :recipe_ingredients
end
