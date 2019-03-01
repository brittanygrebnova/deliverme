class Vendor < ApplicationRecord
  has_many :items
  has_many :orders
  scope :located_in, ->(city) { where("vendors.city == ?", city) }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
