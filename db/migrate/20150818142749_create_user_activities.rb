class CreateUserActivities < ActiveRecord::Migration
  def change
    create_table :user_activities do |t|
      t.references :volume
      t.references :collection
      t.string :value
      t.string :action
      t.references :user
      t.string :object_type
      t.timestamps
    end
    add_index :user_activities, :user_id
  end
end
