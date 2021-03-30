class Item < ApplicationRecord
  

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_origin
  belongs_to :shipping_day
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :description 
    validates :price, inclusion: { in: 300..9_999_999 , message: 'Out of setting range' }
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
  end
  validates :price, numericality: true

  with_options numericality: { other_than: 1, only_integer: true, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id 
    validates :shipping_origin_id 
    validates :shipping_days_id
  end

end
