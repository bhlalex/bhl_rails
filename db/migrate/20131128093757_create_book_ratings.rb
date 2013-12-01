class CreateBookRatings < ActiveRecord::Migration
  def change
    create_table :book_ratings do |t|
      t.references :volume
      t.references :user
      t.decimal :rate, :precision => 2, :scale => 1

      t.timestamps
    end
    add_index :book_ratings, :volume_id
    add_index :book_ratings, :user_id
  end
end
