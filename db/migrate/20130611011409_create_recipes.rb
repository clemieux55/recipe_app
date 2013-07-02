class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :comment_id

      t.timestamps
    end
  end
end
