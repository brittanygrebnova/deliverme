class AddDefaultValueToUsersBalance < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :balance, :integer, :default => 0
  end

  def down
    change_column :users, :balance, :integer, :default => nil
  end
end
