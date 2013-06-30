class RecipeComments < ActiveRecord::Migration
  def up
  	create_table :recipe_comments do |t|
  		t.integer :recipe_id
  		t.integer :user_id
  		t.integer :comment_id
  	end
  end

  def down
  end
end
