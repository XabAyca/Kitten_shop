class CartsController < ApplicationController
  before_action :authenticate_user!, :is_user_cart?, only: [:show]

  def show
    @cart = Cart.find_by(user_id: current_user.id)
  end

  def update
    @cart = Cart.find_by(user_id: current_user.id)
    #check if the product is already in cart
    items_id = current_user.cart.items.map { |item| item.id }

    if (!!items_id.include?(params[:item_id].to_i))
      flash.alert = "Item already in cart !!!"
      redirect_to root_path
    else
      new_item = JointItemsCart.create(cart_id: @cart.id, item_id: params[:item_id])
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    end
  end

end
