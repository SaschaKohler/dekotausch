class CreateOfferItems < ActiveRecord::Migration
  def change
    create_table :offer_items do |t|
      t.references :product, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
