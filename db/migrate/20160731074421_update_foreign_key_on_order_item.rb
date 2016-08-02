class UpdateForeignKeyOnOrderItem < ActiveRecord::Migration
  def change
    # remove the old foreign_key
    remove_foreign_key :order_items, :products
       
       # add the new foreign_key
    add_foreign_key :order_items, :products, on_delete: :cascade
  end
end
