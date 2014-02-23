class SearchController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    render 'results'
  end
end
