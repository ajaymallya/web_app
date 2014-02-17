class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :catalog_item, index: true

      t.timestamps
    end
  end
end
