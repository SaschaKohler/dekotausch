class Product < ActiveRecord::Base
 has_many :pictures, :dependent => :destroy
 has_many :order_items
 belongs_to :category
 belongs_to :user
 belongs_to :offer
 
 #default_scope { where(active: true) }
end
