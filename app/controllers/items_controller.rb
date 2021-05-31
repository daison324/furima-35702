class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update]

  def index
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
    params.require(:item).permit(:title, :text, :prefectures_id, :category_id, :fee_id, :state_id, :days_ship_id, :price).merge(user_id: current_user.id)
  end
end