class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  before_action :set_item, only: [:show, :edit ]


  def index
    @items = Item.all.order("created_at DESC")
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
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:explaration,:category_id,:status_id,:charge_id,:area_id,:shipping_day_id,:price,:user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

