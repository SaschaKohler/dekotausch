class UpdateOrderWithUserId < ActiveRecord::Migration
  def up
    Order.find_each do |order|
      order.user_id = 5
      order.save!  
    end
  end
  
end
