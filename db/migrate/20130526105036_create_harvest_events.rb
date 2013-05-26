class CreateHarvestEvents < ActiveRecord::Migration
  def change
    create_table :harvest_events do |t|
      t.references :harvest_event_type
      t.string :description

      t.timestamps
    end
    add_index :harvest_events, :harvest_event_type_id
  end
end
