class UserSerializer < ActiveModel::Serializer
  attributes :id, :uid, :user_name, :street_address, :city, :state, :balance
  has_many :orders
end
