class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :title, :text, presence: true
  validates :category_id, numericality: { other_than: 1 }

  belongs_to :condition
  validates :title, :text, presence: true
  validates :condition_id, numericality: { other_than: 1 }

  belongs_to :shippig_cost
  validates :title, :text, presence: true
  validates :shipping_cost_id, numericality: { other_than: 1 }

  belongs_to :shipping_origin
  validates :title, :text, presence: true
  validates :shipping_origin_id, numericality: { other_than: 1 }

  belongs_to :shipping_day
  validates :title, :text, presence: true
  validates :shipping_days_id, numericality: { other_than: 1 }
  
end
