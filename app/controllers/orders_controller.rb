class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :set_item

  def index
    @order_address = OrderAddress.new
    if @item.order.present?
      redirect_to root_path
    else
      if current_user.id == @item.user_id
        redirect_to root_path
      end  
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :shipping_area_id, :city_name, :block_name, :buliding_name ,:phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end


end