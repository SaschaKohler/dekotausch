class CartsController < ApplicationController
  before_action :authenticate_user! , only: [:show,:edit]


  def show
    @order_items = current_order.order_items
    @offer = Offer.all
  end

  def edit
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    @order_items = @order.order_items
  end
  
end
