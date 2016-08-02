class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :user, index: true, foreign_key: true, on_delete: :cascade

      t.timestamps null: false
    end
  end
end
