class RecipeIngredient < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id
  belongs_to :recipe
  belongs_to :ingredient
  

end
