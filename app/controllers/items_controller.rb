class ItemsController < ApplicationController
  before_action :move_to, except: [:index ]

  def index
    @items = Item.all
    #@items = Item.other("created_at DESC")
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

  private

  def item_params
    params.require(:item).permit(:image,:name,:explaration,:category_id,:status_id,:charge_id,:area_id,:shipping_day_id,:price,:user).merge(user_id: current_user.id)
  end

  def move_to
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end

