class RemoveFromOrderOrderId < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :product_id, :integer
  end
end
