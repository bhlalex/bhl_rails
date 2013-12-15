class AddDefaultValueToVolumeRate < ActiveRecord::Migration
  def change
    change_column :book_ratings, :rate, :integer, :default => 0
  end
  
  def down
    change_column :book_ratings, :rate, :integer, :default => nil
  end
end
