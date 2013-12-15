class AddDefaultValueToCollectionRate < ActiveRecord::Migration
  def change
    change_column :collection_ratings, :rate, :integer, :default => 0
  end
  
  def down
    change_column :collection_ratings, :rate, :integer, :default => nil
  end
end
