class Buyer < ApplicationRecord
  #アソシエーション
  belongs_to :order
end
