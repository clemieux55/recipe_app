class AddRecipeIdToComment < ActiveRecord::Migration
  def up
  	add_column :comments, :recipe_id, :integer
  end

  def down
  	remove_column :comments, :recipe_id
  end
end
