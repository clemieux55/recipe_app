class AddValueAndUnitToRecipeIngredients < ActiveRecord::Migration
  def change
  	add_column :recipe_ingredients, :value, :string
  	add_column :recipe_ingredients, :unit, :string
  end
  # TODO add down here AND TEST all the things!
end
