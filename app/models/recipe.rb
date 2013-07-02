class Recipe < ActiveRecord::Base
  attr_accessible :author, :title, :description, :ingredients_attributes, :ingredient_ids
  validates_presence_of :description, :length => {:maximun => 500}
  validates_presence_of :title, null: false
  has_many :ingredients, 
  	:through => :recipe_ingredients
  has_many :recipe_ingredients
  accepts_nested_attributes_for :ingredients
  has_many :comments
  # accepts_nested_attributes_for :comments  	
  has_one :user


end
