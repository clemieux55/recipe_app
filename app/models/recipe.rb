class Recipe < ActiveRecord::Base
  attr_accessible :author, :title, :ingredient_ids, :description, :ingredients
  validates_presence_of :description, :length => {:maximun => 500}
  validates_presence_of :title, null: false
  validates :ingredients, :presence => true
  has_many :ingredients, 
  	:through => :recipe_ingredients
  has_many :recipe_ingredients
  has_many :comments
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :ingredients

end
