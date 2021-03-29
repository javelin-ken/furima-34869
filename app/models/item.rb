class Item < ApplicationRecord
  

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  # belongs_to :shippig_cost
  belongs_to :shipping_origin
  belongs_to :shipping_day
  has_one_attached :image
  belongs_to :user

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :shipping_origin_id, numericality: { other_than: 1 }
  validates :shipping_days_id, numericality: { other_than: 1 }
  

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

end
