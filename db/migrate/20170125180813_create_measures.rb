class CreateMeasures < ActiveRecord::Migration[5.0]
  def change
    create_table :measures do |t|
      t.integer :recipe_id
      t.string :ingredient_id
      t.float :quantity

      t.timestamps
    end
  end
end
