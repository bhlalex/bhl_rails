class AddDefaultValueToVolume < ActiveRecord::Migration
  def change
     change_column :volumes, :rate, :integer, :default => 0
   end
   
   def down
     change_column :volumes, :rate, :integer, :default => nil
   end
end
