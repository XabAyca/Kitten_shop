class ApplicationController < ActionController::Base

  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :admin)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :current_password, :admin)}
  end

  def is_user_cart?
    @cart = Cart.find(params[:id])
    if @cart != current_user.cart
      redirect_to root_path, notice:'Ce n\'est pas votre panier'
    end
  end

  def is_admin?
    if current_user.admin == false
      redirect_to root_path, notice:'Vous devez être administrateur pour accèder à cette partie du site'
    end
  end

end
