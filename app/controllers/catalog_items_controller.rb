class CatalogItemsController < ApplicationController
  def index
    @catalog_items = CatalogItem.all
  end

  def show
    @catalog_item = CatalogItem.find(params[:id])
  end

  def edit
    @catalog_item = CatalogItem.find(params[:id])
  end

  def update
    @catalog_item = CatalogItem.find(params[:id])
    if @catalog_item.update(catalog_item_params)
      redirect_to @catalog_item
    else
      render 'edit'
    end
  end

  private
    def catalog_item_params
      params.require(:catalog_item).permit(:title, :authors, :description)
    end
end
