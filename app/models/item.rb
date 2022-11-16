class Item < ApplicationRecord
  
  with_options presence: true do
    validates :user_id
    validates :image
    validates :title
    validates :description
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price
  end
  
  
  
  belongs_to :user
  # has_one    :order
  has_one_attached :image
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  # active_storageのアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  
  
  
  with_options numericality: { other_than: 1 }  do
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end

  validates_inclusion_of :price, in: 300..9999999
  validates :price, numericality: { with: /\A[0-9]+\z/}


end
