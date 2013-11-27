class RemoveResult < ActiveRecord::Migration
  def up
    remove_column :queries, :number_of_returned_books
  end

  def down
  end
end
