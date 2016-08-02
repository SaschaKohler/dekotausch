class Category < ActiveRecord::Base
  has_many :products , :dependent => :destroy


  def self.title_by_product_id (id)
    @category = Category.find(id).title
  end
  
end
