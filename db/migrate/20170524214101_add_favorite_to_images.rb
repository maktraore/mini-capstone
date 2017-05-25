class AddFavoriteToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :favorite, :boolean
  end
end
