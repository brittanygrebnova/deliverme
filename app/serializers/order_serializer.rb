class OrderSerializer < ActiveModel::Serializer
  attributes :id, :delivery_charge, :delivered, :created_at
  belongs_to :user
  belongs_to :vendor
  has_many :items
end
