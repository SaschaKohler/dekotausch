class AddOfferToOfferItems < ActiveRecord::Migration
  def change
    remove_reference :offer_items , :order, index: true, foreign_key: true
    add_reference :offer_items, :offer, index: true, foreign_key: true
  end
end
