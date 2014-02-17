class AddCartIdToCatalogItems < ActiveRecord::Migration
  def change
    add_column :catalog_items, :cart_id, :integer
  end
end
