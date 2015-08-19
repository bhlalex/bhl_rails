class RemoveBookHistoryTable < ActiveRecord::Migration
  def up
    drop_table :user_books
  end

  def down
  end
end
