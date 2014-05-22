class AddBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :balance, :decimal, default: 10.00
  end
end
