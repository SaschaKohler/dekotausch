class AddOrderToOffer < ActiveRecord::Migration
  def change
    add_reference :offers, :order, index: true, foreign_key: true, on_delete: :cascade
  end
end
