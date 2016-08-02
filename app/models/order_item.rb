class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validate :product_present
  validate :order_present

  def self.product_in_current_order(product_id,current_order_id)
    @test = OrderItem.where(product_id: product_id,order_id: current_order_id)
    if @test != []
      @test = true
    else
      @test = nil
    end
    @test
  end
  
  private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  
  def order_present
    if order.nil?
      errors.add(:order,"is not a valid order")
    end
  end
  
end
