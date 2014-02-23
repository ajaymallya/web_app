class SearchController < ApplicationController
  before_action :current_user
  def new
    @search = Search.new
  end

  def create
    redirect_to catalog_items_path
  end
end
