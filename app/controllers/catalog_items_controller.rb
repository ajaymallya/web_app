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
      flash[:notice] = "Item has been updated"
      redirect_to @catalog_item
    else
      render 'edit'
    end
  end

  def new
    @catalog_item = CatalogItem.new
  end

  def create
    @catalog_item = CatalogItem.new(catalog_item_params)
    if @catalog_item.save
      redirect_to @catalog_item
    else
      render 'new'
    end
  end

  def destroy
    @catalog_item = CatalogItem.find(params[:id])
    @catalog_item.destroy
    redirect_to catalog_items_path
  end

  private
    def catalog_item_params
      params.require(:catalog_item).permit(:title, :authors, :description)
    end
end
