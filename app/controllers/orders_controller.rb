class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find

  def index
    @form_object = FormObject.new
  end

  # def new
  #   @form_object = FormObject.new
  # end

  def create
    @form_object = FormObject.new(order_params)
    if @form_object.valid?
      @form_object.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:form_object).permit(:postal_code, :state_id, :city, :address1, :address2, :telnumber).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

end
