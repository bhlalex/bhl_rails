class AddResultsToQuery < ActiveRecord::Migration
  def change
    add_column :queries, :number_of_returned_books, :integer
  end
end
