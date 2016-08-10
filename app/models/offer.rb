class Offer < ActiveRecord::Base
  belongs_to :users
  has_many :offer_items


end
