class AddColumnsToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :name, :string
    add_column :vendors, :city, :string
    add_column :vendors, :state, :string
    add_column :vendors, :category, :string
  end
end
