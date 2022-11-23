class OrdersController < ApplicationController
  def index
    @order_form = OrderFrom.new
    
  end
  
  def create
    @order_form = OrderForm.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_from).permit(:postal_code, :shipping_area_id, :city_name, :block_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
