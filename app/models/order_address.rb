class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city_name, :block_name, :phone_number, :item_id, :user_id, :buliding_name
  

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code 
    validates :shipping_area_id
    validates :city_name
    validates :block_name
    validates :phone_number
  end

  validates :shipping_area_id, numericality: {other_than: 1, message: "can't be blank"}


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city_name: city_name, block_name: block_name, phone_number: phone_number, order_id: order_id)
  end
end
