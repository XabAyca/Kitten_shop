class OrdersController < ApplicationController
  before_action :authenticated?

  
  def show 
    @order = Order.find(params[:id])
  end

  def create 
    @user = current_user
    @order = Order.new(user_id:@user.id)
    @user.cart.items.each do |item|
      JointItemsOrder.create(order_id:@order.id,item_id:item.id)
    end
    current_user.cart.items.destroy.all

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
        description: "Commande",
        currency: 'auto',
        })
      rescue Stripe::CardError => e
        flash[:error] = e.message
      end
      redirect_to root_path, notice: 'Votre commande a bien été passé, vous recevrez vos images par e-mail'
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
