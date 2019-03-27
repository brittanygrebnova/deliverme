class Order < ApplicationRecord
  belongs_to :vendor
  belongs_to :user
  has_many :item_orders
  has_many :items, :through => :item_orders

  def readable_date
    self.created_at.strftime("%b %d, %Y")
  end

  def total
    sub_total = self.items.sum(:price)
    sub_total + delivery_charge
  end

  def place_order
    self.user.balance -= self.total
    self.user.save
  end

  def deliver
    self.delivered = true
  end

end
