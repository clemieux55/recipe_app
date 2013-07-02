class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :user_id
      t.integer :comment_id
      t.integer :recipe_comment_id

      t.timestamps
    end
  end
end
