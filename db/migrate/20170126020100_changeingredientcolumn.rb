class Changeingredientcolumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :measures, :ingredient_id, :integer
    add_column :measures, :ingredient, :string
  end
end
