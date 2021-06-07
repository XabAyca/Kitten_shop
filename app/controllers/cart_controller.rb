class CartController < ApplicationController
  def create
    p params[:item_id]
  end

  def destroy
  end
end
