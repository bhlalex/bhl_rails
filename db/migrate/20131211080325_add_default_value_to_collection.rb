class AddDefaultValueToCollection < ActiveRecord::Migration
  def change
     change_column :collections, :rate, :integer, :default => 0
   end
   
   def down
     change_column :collections, :rate, :integer, :default => nil
   end
end
