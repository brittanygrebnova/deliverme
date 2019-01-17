class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :vendor_id, :integer
  end
end
