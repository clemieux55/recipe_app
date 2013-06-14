class Recipe < ActiveRecord::Base
  attr_accessible :author, :title, :ingredients_attributes, :description
  validates_presence_of :title, :description, {:maximun => 500}
  has_many :ingredients, :through => :recipe_ingredients
  has_many :recipe_ingredients
  accepts_nested_attributes_for :ingredients

end
