module UsersHelper
  def signup_message
    link_to "Sign up", new_user_path unless current_user
  end

  def signin_message
    link_to "Sign in", signin_path unless current_user
  end

  private
    def current_user
      @current_user
    end
end
