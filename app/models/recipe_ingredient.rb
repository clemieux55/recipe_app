class RecipeIngredient < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id
  belongs_to :recipe
  belongs_to :ingredient
  has_many :recipes
  has_many :ingredients
  validates_presence_of :ingredient_id, scope: { uniqueness: true }
  validates_presence_of :recipe_id,  scope: { uniqueness: true } 
end
