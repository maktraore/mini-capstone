class RemoveFromOrderQuantity < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :quantity, :integer
  end
end
