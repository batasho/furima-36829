class PurchasesController < ApplicationController
  #before_action :authenticate_user! #except: [:index, :show ]
  #before_action :trans_top, only: [:index, :create ]

  def index
    @buyer_purchase = BuyerPurchase.new
    @item = Item.find(params[:item_id])
    @purchase = Purchase.all
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_purchase = BuyerPurchase.new(purchase_params)
    if @buyer_purchase.valid?
      pay_item
      @buyer_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:buyer_purchase).permit(:postal, :area_id, :municipality, :address, :building, :phone, :purchase_id ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, #商品の金額をデータベースから取り出す
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  # def trans_top
  #   redirect_to root_path unless current_user.id == @item.user_id
  # end

end
