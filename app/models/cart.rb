class Cart < ActiveRecord::Base
  has_many :catalog_items
end
