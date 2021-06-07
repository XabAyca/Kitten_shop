class OrdersController < ApplicationController
  before_action :authenticate?

  
  def show 
    @order = Order.find(params[:id])
  end

  def create 
    @user = current_user
    @order = Order.new(user_id:@user.id)
    @user.cart.items.each do |item|
      JointItemsOrder.create(order_id:@order.id,item_id:item.id)
    end
    if @order.save 
      redirect_to root_path, notice: "La commande est bien passé"
    else
      flash.now[:danger] = @order.errors.full_messages
      render :back
    end
  end
  
  private


end
