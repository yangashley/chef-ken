class CreateMeasures < ActiveRecord::Migration[5.0]
  def change
    create_table :measures do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :quantity
      t.string :units

      t.timestamps
    end
  end
end
