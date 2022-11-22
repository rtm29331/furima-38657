class OrderFrom < ApplicationRecord
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



end
