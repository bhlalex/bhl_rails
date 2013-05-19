class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :string
      t.references :user

      t.timestamps
    end
    add_index :queries, :user_id
  end
end
