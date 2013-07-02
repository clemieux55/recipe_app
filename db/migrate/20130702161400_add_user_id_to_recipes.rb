class AddUserIdToRecipes < ActiveRecord::Migration
  def up
  	add_column :recipes, :user_id, :integer, :null => false
  end

  def down 
  	remove_column :recipes, :user_id
  end
end
