class Item < ApplicationRecord

  validates :product_name,presence: true
  validates :description,presence: true
  validates :category_id presence: true
  validates :condition_id ,presence: true
  validates :shipping_charges_id ,presence: true
  validates :state_id ,presence: true
  validates :price,presence: true

  belongs_to :user
  
end
