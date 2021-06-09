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

  def new 
    @item = Item.new()
  end

  def create
    @item = Item.new(post_params())
    if @item.save
      redirect_to admin_items_path, notice:'Produit créé'
    else
      flash.now[:messages] = @item.errors.full_messages
      render new_admin_item_path
    end
  end

  def edit 
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(post_params)
      redirect_to admin_items_path,notice:'Produit modifié'
    else
      flash.now[:messages] = @event.errors.full_messages
      render :edit
    end  
  end

  private

  def post_params
    params.require(:item).permit(:title,:description,:price,:image_url)
  end

end
