class RemoveVendorIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :vendor_id, :integer
  end
end
