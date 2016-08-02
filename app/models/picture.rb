class Picture < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image, styles: { 
    		      	      	      medium: "300x300>", 
				      thumb: "100x100>" 
				      }
				      # default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def self.picture_first_as_thumb (product_id)
   @picture = Picture.where(product_id: product_id)
   @picture_first = @picture.first
   @picture_first_as_thumb = @picture_first.image.url(:thumb)
  end

end

