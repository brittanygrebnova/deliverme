class Item < ApplicationRecord
  belongs_to :vendor
  has_many :orders, :through => :items_orders
end
