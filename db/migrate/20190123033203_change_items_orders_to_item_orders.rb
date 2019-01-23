class ChangeItemsOrdersToItemOrders < ActiveRecord::Migration[5.2]
  def change
    rename_table :items_orders, :item_orders 
  end
end
