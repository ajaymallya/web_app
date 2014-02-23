class CartsController < ApplicationController
  before_action :require_signin!
  def show
    @cart = cart
  end

  def add_to_cart
    catalog_item = CatalogItem.find(params[:catalog_item_id])
    if cart.nil?
      @current_user.cart = Cart.new
    end
    cart.catalog_items << catalog_item
    cart.save
    redirect_to cart
  end

  def delete_from_cart
    catalog_item = CatalogItem.find(params[:catalog_item_id])
    cart.catalog_items.delete(catalog_item)
    redirect_to cart_path(cart)
  end

  private
    def require_signin!
      unless logged_in?
        flash[:error] = "You must be logged in to view your cart."
        redirect_to '/signin'
      end
      @current_user = User.where(name: session[:user_name]).first
    end

    def logged_in?
      !session[:user_name].nil?
    end

    def cart
      @current_user.cart
    end
end
