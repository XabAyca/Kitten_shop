class StaticPagesController < ApplicationController
  def index
    @items = Item.all
  end

  def team
  end

end
