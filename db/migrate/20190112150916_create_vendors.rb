class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|

      t.timestamps
    end
  end
end
