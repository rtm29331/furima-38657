class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one    :order

  has_one_attached :image
  
  # active_storageのアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  
  
  
  with_options presence: true do
    validates :user_id
    validates :image
    validates :title
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  
  end


end
