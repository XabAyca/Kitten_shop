class Admin::ItemsController < ApplicationController
  before_action :authenticate_user!, :is_admin?

  def index 
    @items = Item.all
  end

  def destroy
    @items = Item.all
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to admin_items_path }
      format.js { }
    end
  end

end
