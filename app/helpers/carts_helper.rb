module CartsHelper
  def cart_header
    link_to 'View Cart', current_user ? current_user.cart : '/signin'
  end

  def greeting
    "Hello, #{current_user.name}"
  end

  private
    def current_user
      @current_user
    end
end
