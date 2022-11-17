class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :order
  
  has_one_attached :image
  
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :user
    validates :image
    validates :title
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, presence:true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9_999_999 }
    
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
end
