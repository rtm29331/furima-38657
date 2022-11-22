class OrderFrom < ApplicationRecord
 
  attr_accessor :postal_code, :shipping_area_id, :city_name, :block_name, :phone_number, :item_id, :user_id
  
  belongs_to :order

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code
    validates :shipping_area_id
    validates :city_name
    validates :block_name
    validates :phone_number
  end

  validates :shipping_area_id, numericality: {other_than: 0, message: "can't be blank"}


  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city_name: city_name, block_name: block_name, phone_number: phone_number, order_id:order_id)
  end
end
