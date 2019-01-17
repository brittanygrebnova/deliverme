class RemoveTotalFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :total
  end
end
