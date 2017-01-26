class Addunitscolumn < ActiveRecord::Migration[5.0]
  def change
    add_column :measures, :units, :string
  end
end
