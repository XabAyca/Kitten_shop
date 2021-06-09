class ItemImagesController < ApplicationController
  def create
    p params
    @item = User.find(params[:item_id])
    @item.item_image.attach(params[:item_image])
    redirect_back fallback_location: item_path(@item)
  end

  def update
  end
end
