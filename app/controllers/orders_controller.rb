class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :set_item

  def index
    @order_shipping = OrderShipping.new
    if @item.order.present?
      redirect_to root_path
    else
      if current_user.id == @item.user_id
        redirect_to root_path
      end  
    end
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end



  private

   def order_params
      params.require(:order_address).permit(:postal_code, :shipping_area_id, :city_name, :block_name, :phone_number, :buliding_name).merge(user_id: current_user.id, item_id: @item.id)
   end
end
