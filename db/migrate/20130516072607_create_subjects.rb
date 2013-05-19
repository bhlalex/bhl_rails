class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :location
      t.integer :location_lookup_fail

      t.timestamps
    end
    add_index :subjects, :location_id
  end
end
