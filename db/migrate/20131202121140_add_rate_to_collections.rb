class AddRateToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :rate, :decimal, :precision => 2, :scale => 1
  end
end
