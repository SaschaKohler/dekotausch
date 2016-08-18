class CartsController < ApplicationController
  before_action :authenticate_user! , only: [:show,:edit]


  def show
    @order_items = current_order.order_items
    @offer_items = current_offer.offer_items
  end

  def edit
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    @offer = Offer.where(order_id:  @order.id).first
    session[:offer_id] = @offer.id
    @order_items = @order.order_items
  end
  
end
