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

    @amount = params[:total].to_d
    if @order.save 
      begin
        customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
        })
        charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount*100,
        description: "Achat d'un produit",
        currency: 'eur',
        })
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_order_path
      end
    else
      flash.now[:danger] = @order.errors.full_messages
      render :back
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
  end
  
  private


end
