class AddRateToVolumes < ActiveRecord::Migration
  def change
    add_column :volumes, :rate, :decimal, :precision => 2, :scale => 1
  end
end
