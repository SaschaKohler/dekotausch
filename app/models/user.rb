class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :products , :dependent => :destroy
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
	 :omniauthable, :omniauth_providers => [:google_oauth2]


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    
     unless user
         user = User.create(
            email: data["email"],
            password: Devise.friendly_token[0,20],
	    provider: "google"
        )
     end
    user

  end
end




