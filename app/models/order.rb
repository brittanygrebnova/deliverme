class Order < ApplicationRecord
  belongs_to :vendor
  belongs_to :user
  has_and_belongs_to_many :items

  def readable_date
    self.created_at.strftime("%b %d, %Y")
  end

  def total
    self.items.sum(:price)
  end

  def deliver
    self.delivered = true
    self.user.balance -= 5
  end

end
