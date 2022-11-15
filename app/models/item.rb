class Item < ApplicationRecord

  belongs_to :user
  has_one    :order

  has_one_attached :image
  
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :price
  end
end
