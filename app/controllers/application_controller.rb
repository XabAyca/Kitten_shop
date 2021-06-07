class ApplicationController < ActionController::Base

  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :admin)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :current_password, :admin)}
  end

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def login?
    !!current_user()
  end

  def authenticated?
    redirect_to new_user_session_path unless login?()
  end
    
end
