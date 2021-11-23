class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  def destroy
    # ログインしているユーザーと同一であればデータを削除する
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :condition_id, :shipping_charge_id, :state_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
