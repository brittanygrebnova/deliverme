class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  belongs_to :vendor
  belongs_to :order
end
