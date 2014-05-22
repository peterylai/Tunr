class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :song
      t.references :user
    end
  end
end
