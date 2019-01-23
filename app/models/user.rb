class User < ApplicationRecord
  has_many :orders
  has_many :items_orders
  has_many :items, :through => :orders


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.email = auth.info.email
       user.image = auth.info.image
       user.user_name = auth.info.name
       user.password = Devise.friendly_token[0,20]
     end
  end

  def readable_date
    self.created_at.strftime("%b %d, %Y")
  end

  def add_money(amount)
    self.balance += amount
  end



end
