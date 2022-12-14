class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item

  def index
    @order_address = OrderAddress.new
    if @item.order.present?
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
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
    params.require(:order_address).permit(:postal_code, :shipping_area_id, :city_name, :block_name, :buliding_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,          # 商品の値段
      card: order_params[:token],  # カードトークン
      currency: 'jpy'
    )
  end
end