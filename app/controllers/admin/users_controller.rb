class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, :is_admin?

  
end
