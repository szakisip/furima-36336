class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #アソシエーション
  #他テーブルとのアソシエーション
  belongs_to :user

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :state
  belongs_to :shipping_day

  #ActiveStorageとのアソシエーション
  has_one_attached :image


  #バリデーション
  #各項目
  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :state_id
    validates :shipping_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  end

  #プルダウンを"---"選択時保存不可
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :state_id
    validates :shipping_day_id
  end

end
