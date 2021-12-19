class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]

  #出品者か購入済みであればトップページに遷移する
  before_action :go_toppage, only: [:index, :create]

  def index
    @form_object = FormObject.new
  end

  def create
    @form_object = FormObject.new(order_params)
    if @form_object.valid?
      pay_item
      @form_object.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:form_object).permit(:postal_code, :state_id, :city, :address1, :address2, :telnumber).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def go_toppage
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
