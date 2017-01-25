class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :category_id
      t.integer :user_id
      t.time :time
      t.string :difficulty
      t.string :directions

      t.timestamps
    end
  end
end
