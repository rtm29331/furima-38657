class OrdersController < ApplicationController
  def index
    @order_form = OrderFrom.new
  end
  
  def create
    binding.pry
  end
end

end
