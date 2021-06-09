class Admin::AdminController < ApplicationController
  before_action :authenticate_user!, :is_admin?

  def index
    @orders = Order.all
  end

end
