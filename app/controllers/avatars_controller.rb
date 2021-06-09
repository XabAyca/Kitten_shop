class AvatarsController < ApplicationController
  def create
    p params
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(user_path(@user))
  end

  def update
  end
end
