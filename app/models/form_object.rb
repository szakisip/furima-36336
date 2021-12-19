class FormObject
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :state_id, :city, :address1, :address2, :telnumber, :token
  
  # アクティブハッシュとアソシエーション
  # belongs_to :state

  # バリデーション
  with_options presence: true do
    # orderモデルのバリデーション
    validates :item_id
    validates :user_id
    # buyerモデルのバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)'}
    validates :state_id, numericality: { other_than: 0 }
    validates :city
    validates :address1
    validates :telnumber, format: { with: /\A[0-9]{11}\z/ }
    # トークンのバリデーション
    validates :token
  end
 

  def save
    # 購入履歴の保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 配送先の住所を保存
    Buyer.create(order_id: order.id, postal_code: postal_code, state_id: state_id, city: city, address1: address1, address2: address2, telnumber: telnumber)
  end

end
