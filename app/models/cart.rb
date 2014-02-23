class Cart < ActiveRecord::Base
  has_many :catalog_items
  belongs_to :user
end
