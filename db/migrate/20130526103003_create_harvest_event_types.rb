class CreateHarvestEventTypes < ActiveRecord::Migration
  def change
    create_table :harvest_event_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
