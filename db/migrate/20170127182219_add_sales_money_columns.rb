class AddSalesMoneyColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :cents, :integer, :null => false
    add_column :sales, :volume, :integer, :null => false
    add_column :sales, :sale_price, :integer, :null => false
    add_index(:sales, :volume)
    add_index(:sales, :sale_price)
  end
end
