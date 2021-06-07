class ApplicationController < ActionController::Base

  #cart
  def current_cart
    if user_signed_in?
      @cart = current_user.cart
    end
  end
end
