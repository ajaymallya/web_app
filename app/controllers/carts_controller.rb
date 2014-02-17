class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def add_to_cart
    begin
      @cart = Cart.find(1)
    rescue
      @cart = Cart.new
    end
    catalog_item = CatalogItem.find(params[:catalog_item_id])
    @cart.catalog_items << catalog_item
    @cart.save
    redirect_to @cart
  end
end
