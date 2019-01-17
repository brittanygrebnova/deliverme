class Item < ApplicationRecord
  belongs_to :vendor
  has_and_belongs_to_many :orders
end
