class AddVendorIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :vendor_id, :integer
  end
end
