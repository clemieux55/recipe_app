class AddIngredientToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :ingredient_id, :integer
  end
end
