class CreateUserBookHistories < ActiveRecord::Migration
  def change
    create_table :user_book_histories do |t|
      t.references :user
      t.references :volume
      t.datetime :last_visited_date

      t.timestamps
    end
    add_index :user_book_histories, :user_id
    add_index :user_book_histories, :volume_id
  end
end
