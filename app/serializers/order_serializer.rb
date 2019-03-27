class OrderSerializer < ActiveModel::Serializer
  attributes :id, :delivery_charge, :delivered
  belongs_to :user, :vendor
end
