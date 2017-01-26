class Changetimecolumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :time, :time
    add_column :recipes, :time, :integer
  end
end
