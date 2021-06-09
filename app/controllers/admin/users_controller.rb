class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, :is_admin?

  def index 
    @users = User.all
  end

  def destroy 
    @users = User.all
    @user  = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice:'Utilisateur supprimé' }
      format.js   { }
    end
  end

  def update 
    @user = User.find(params[:id])
    @user.update(post_params)
    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.js   {}
    end
  end

  private

  def post_params
    params.require(:user).permit(:first_name,:last_name,:email,:admin)
  end
end
