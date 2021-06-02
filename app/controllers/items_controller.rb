class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]


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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
     else
      render :edit
    end
  end

  
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :title, :text, :prefecture_id, :category_id, :fee_id, :state_id, :days_ship_id, :price).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless @item.user == current_user
  end


end
