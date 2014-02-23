module CartsHelper
  def cart_header
    link_to 'View Cart', current_user ? current_user.cart : '/signin'
  end

  private
    def current_user
      @current_user
    end
end
