class AddDefaultValueToVolumes < ActiveRecord::Migration
  def change
     change_column :volumes, :rate, :decimal, :precision => 2, :scale => 1, :default => 0
   end
   
   def down
     change_column :volumes, :rate, :decimal, :precision => 2, :scale => 1, :default => nil
   end
end
