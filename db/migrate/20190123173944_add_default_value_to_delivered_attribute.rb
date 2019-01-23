class AddDefaultValueToDeliveredAttribute < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :delivered, :boolean, default: false
  end

  def down
    change_column :orders, :delivered, :boolean, default: nil
  end
end
