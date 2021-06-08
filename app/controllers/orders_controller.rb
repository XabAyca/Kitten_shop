class OrdersController < ApplicationController
  before_action :authenticate_user!

  
  def show 
    @order = Order.find(params[:id])
  end

  def create 
    @user = current_user
    @amount =@user.cart.total
    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount.to_i,
      description: "Commande",
      currency: 'eur',
      })
    rescue Stripe::CardError => e
      flash[:error] = e.message
    end

    @order = Order.create(user_id:@user.id)
    @user.cart.items.each do |item|
      JointItemsOrder.create(order_id:@order.id,item_id:item.id)
    end
    current_user.cart.items.destroy_all
    redirect_to root_path, notice: 'Votre commande a bien été passé, vous recevrez vos images par e-mail'
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
  end
  
  private


end
