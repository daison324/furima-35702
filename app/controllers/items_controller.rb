class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  before_action :authenticate_user!, except: [:index, :show]
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
      render new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :text, :prefecture_id, :category_id, :fee_id, :state_id, :days_ship_id, :price).merge(user_id: current_user.id)
  end
end