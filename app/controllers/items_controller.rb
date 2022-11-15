class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
  #   @items = Item
  end

  def new
    # @item = Item.new
  end
  
  
  
  
  
  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end




end
