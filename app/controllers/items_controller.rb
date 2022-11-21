class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :authenticate_user!, except: [:index, :show]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    return if @item.user_id == current_user.id

    redirect_to root_path
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
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
