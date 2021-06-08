class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @cart =current_user.cart
    @item = Item.find(params[:id])
    @a = JointItemsCart.where(cart_id:@cart.id).all
    @a.filter{|item| item.item_id == @item.id}[0].delete
  end
end
