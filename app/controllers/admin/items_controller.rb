class Admin::ItemsController < ApplicationController
  before_action :authenticate_user!, :is_admin?

  
end
