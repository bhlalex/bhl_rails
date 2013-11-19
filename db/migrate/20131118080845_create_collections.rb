class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references :user
      t.string :title
      t.string :description
      t.boolean :status
      t.datetime :last_modified_date
      t.datetime :creation_date

      t.timestamps
    end
    add_index :collections, :user_id
  end
end
