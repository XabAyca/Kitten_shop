class CartController < ApplicationController
  def show
    @cart = Cart.find_by(user_id: current_user.id)
  end

  def update
    @cart = Cart.find_by(user_id: current_user.id)
    new_item = JointItemsCart.create(cart_id: @cart.id, item_id: params[:item_id])
  end

  def destroy
  end
end
