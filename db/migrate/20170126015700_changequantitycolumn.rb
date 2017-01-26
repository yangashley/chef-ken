class Changequantitycolumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :measures, :quantity, :float
    add_column :measures, :quantity, :string
  end
end
