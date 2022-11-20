class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  # before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
  
  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    end
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :shipping_charge_id, :shipping_area_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
