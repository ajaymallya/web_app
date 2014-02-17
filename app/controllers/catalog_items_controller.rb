class CatalogItemsController < ApplicationController
  def index
    @catalog_items = CatalogItem.all
  end

  def show
  end
end
