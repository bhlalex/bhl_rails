class RemoveLastVisitedDateFromUserBookHistories < ActiveRecord::Migration
  def up
    remove_column :user_book_histories, :last_visited_date
  end

  def down
    add_column :user_book_histories, :last_visited_date, :datetime
  end
end
