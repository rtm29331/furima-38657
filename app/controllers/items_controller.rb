class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  # before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all.order('created_at DESC')
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
    # @item = Item.find(params[:id])
  end

  def edit
  end

  # def destroy
  #   @item = Item.find(params[:id])
  #   return unless @item.destroy

  #   redirect_to root_path
  # end

 

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :shipping_charge_id, :shipping_area_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
