class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :book_count, :default => 0

      t.timestamps
    end
  end
end
