class AddPricetoSongs < ActiveRecord::Migration
  def change
    add_column :songs, :price, :decimal, default: 1.99
  end
end
