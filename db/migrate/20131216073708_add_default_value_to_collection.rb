class AddDefaultValueToCollection < ActiveRecord::Migration
  def change
     change_column :collections, :rate, :decimal, :precision => 2, :scale => 1, :default => 0
   end
   
   def down
     change_column :collections, :rate, :decimal, :precision => 2, :scale => 1, :default => nil
   end
end
