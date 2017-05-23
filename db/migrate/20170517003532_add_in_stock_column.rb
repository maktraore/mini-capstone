class AddInStockColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, :decimal, precision: 5, scale: 2
    add_column :products, :in_stock, :boolean, default: true
  end
end
