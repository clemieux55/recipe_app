class AddDescriptionToRecipeTable < ActiveRecord::Migration
  def up
    add_column :recipes, :description, :text
  end

  def down
  	remove_column :recipes, :description
  end
end
