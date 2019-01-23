class Item < ApplicationRecord
  belongs_to :vendor
  has_many :item_orders
  has_many :orders, :through => :item_orders
end
