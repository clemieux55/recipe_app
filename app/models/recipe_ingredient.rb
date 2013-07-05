class RecipeIngredient < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id, :value, :unit
  belongs_to :recipe
  belongs_to :ingredient
  validates_presence_of :ingredient_id
  validates_presence_of :recipe_id
  
  def measurement
  	[value, unit].join(" ")
  end
end
