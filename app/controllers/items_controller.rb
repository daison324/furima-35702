class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
    def index
    end
  
  end
    def new
      @item = Item.new
    end
  
    def create
      if @item.valid?
        @item.save
        redirect_to root_path
        redirect_to root_path
      else
        render :new
      
    end
  
  
    private
  
    def item_params
      params.require(:item).permit(:image, :title, :text, :category_id, :state_id, :fee_id, :prefecture_id, :days_ship_id, :price).merge(user_id: current_user.id)
  end

   def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

end