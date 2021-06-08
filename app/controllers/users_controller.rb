class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @orders = current_user.order.all
  end
end
