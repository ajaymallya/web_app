class SessionsController < ApplicationController
  def create
    user = User.where(:name => params[:sign_in][:name]).first
    if user && user.authenticate(params[:sign_in][:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      flash[:notice] = "Signed in successfully."
      redirect_to root_url
    else
      flash[:error] = "Sorry."
      render :new
    end
  end
end
