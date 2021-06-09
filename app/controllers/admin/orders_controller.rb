class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!, :is_admin?

  def index 
    @orders = Order.all
  end

  def destroy
    @orders = Order.all
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to admin_orders_path }
      format.js   { }
    end
  end

end
