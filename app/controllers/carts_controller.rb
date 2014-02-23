class CartsController < ApplicationController
  before_action :require_signin!
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

  def delete_from_cart
    @cart = Cart.find(params[:id])
    catalog_item = CatalogItem.find(params[:catalog_item_id])
    @cart.catalog_items.delete(catalog_item)
    redirect_to cart_path(@cart)
  end

  private
    def require_signin!
      unless logged_in?
        flash[:error] = "You must be logged in to view your cart."
        redirect_to '/signin'
      end
    end

    def logged_in?
      !session[:user_name].nil?
    end
end
