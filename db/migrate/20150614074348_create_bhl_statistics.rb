class CreateBhlStatistics < ActiveRecord::Migration
  def up
    create_table :bhl_statistics do |t|
      t.integer :books_count
      t.integer :authors_count
      t.integer :species_count

      t.timestamps
    end
  end
  
  def down
    drop_table :bhl_statistics
  end
end
