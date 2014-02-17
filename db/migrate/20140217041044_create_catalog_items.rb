class CreateCatalogItems < ActiveRecord::Migration
  def change
    create_table :catalog_items do |t|
      t.string :title
      t.string :authors
      t.text :description

      t.timestamps
    end
  end
end
