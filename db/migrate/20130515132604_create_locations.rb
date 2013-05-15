class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :formatted_address
      t.float :latitude
      t.float :longitude
      t.references :country

      t.timestamps
    end
    add_index :locations, :country_id
  end
end
