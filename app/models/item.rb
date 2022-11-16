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
    validates :title, :description, :image

    with_options numericality: { other_than: 1 } do
      validates :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 300, less_than: 9_999_999 }
    end
  end
end
