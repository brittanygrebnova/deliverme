class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  belongs_to :vendor
end
