class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # 重複処理をまとめる
  before_action :item_find, only:[:show, :edit, :update, :destroy]

  #出品者でなければトップページに遷移する
  before_action :go_toppage, only:[:edit, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(item_params)
    else
      render 'edit'
    end
  end

  def destroy
       @item.destroy
       redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :condition_id, :shipping_charge_id, :state_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def go_toppage
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end
