class FormObject
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :state_id, :city, :address1, :address2, :telnumber
  
  #アクティブハッシュとアソシエーション
  # belongs_to :state

  #バリデーション
  with_options presence: true do
    #orderモデルのバリデーション
    validates :item_id
    validates :user_id
    #buyerモデルのバリデーション
    validates :postal_code
    validates :state_id
    validates :city
    validates :address1
    validates :telnumber
  end
  validate :address2

  def save
    #購入履歴の保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    #配送先の住所を保存
    Buyer.create(postal_code: postal_code, state_id: state_id, city: city, address1: address1, address2: address2, telnumber: telnumber, order_id: order_id)
  end

end
