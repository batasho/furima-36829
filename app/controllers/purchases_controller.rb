class PurchasesController < ApplicationController
  before_action :set_item
  before_action :move_to_index
  before_action :buyer_top
  before_action :trans_top

  def index
    @buyer_purchase = BuyerPurchase.new
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:buyer_purchase).permit(:postal, :area_id, :municipality, :address, :building, :phone ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, #商品の金額をデータベースから取り出す
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def trans_top #購入済の商品を購入しようとするとトップページに遷移
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def buyer_top #自分が出品した商品の購入ページに遷移するとトップページに遷移
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_index #ログアウト時に購入ページに遷移しようとするとログインページに遷移
    unless user_signed_in?
      redirect_to "http://localhost:3000/users/sign_in"
    end
  end

end
