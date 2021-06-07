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
      @session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [{
          price_data: {
            currency: 'eur',
            product_data: {
              name: 'Cat picks',
            },
            unit_amount: (@amount*100).to_i,
          },
          quantity: 1,
        }],
        mode: 'payment',
        # These placeholder URLs will be replaced in a following step.
        success_url: root_path, notice:'Le paiment de a bien été effectué'
        cancel_url: redirect_to :back, flash.now[:danger]='Le paiment a échoué'
      })

      respond_to do |format|
        format.js
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
