class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :date, :datetime
    add_column :orders, :vendor_id, :string
    add_column :orders, :user_id, :string
    add_column :orders, :delivery_charge, :integer, default: 5
    add_column :orders, :delivered, :boolean
  end
end
