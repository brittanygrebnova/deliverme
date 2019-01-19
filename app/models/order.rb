class Order < ApplicationRecord
  belongs_to :vendor
  belongs_to :user
  has_and_belongs_to_many :items

  def readable_date
    self.created_at.strftime("%b %d, %Y")
  end

  def total
    sub_total = self.items.sum(:price)
    sub_total + 5
  end

  def place_order
    self.user.balance - self.total
  end


  def deliver
    self.delivered = true
  end

end
