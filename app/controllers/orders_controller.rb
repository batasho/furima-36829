# class OrdersController < ApplicationController

#   def index
#     @buyer_order = BuyerOrder.new
#   end

#   def create
#     @buyer_order = BuyerOrder.new(order_params)
#     binding.pry
#     if @buyer_order.valid?
#       @buyer_order.save
#       redirect_to root_path
#     else
#       render :index
#     end
#   end

#   private

#   def order_params
#     params.require(:buyer_order).permit(:postal, :area_id, :municipality, :address, :building, :phone, :order, :user, :item).merge(user_id: current_user.id)
#   end
# end
