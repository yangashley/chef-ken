class DropTableIngredients < ActiveRecord::Migration[5.0]
  def up
    drop_table :ingredients
  end

  def down
    create_table :ingredients do |t|
      t.string :name

      t.timestamps
    end
  end
end
