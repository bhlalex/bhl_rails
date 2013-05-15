class CreateBooksLocationsJoin < ActiveRecord::Migration
  def up
    create_table 'books_locations', :id => false do |t|
      t.column 'book_id', :integer
      t.column 'location_id', :integer
    end
    
    add_index 'books_locations', :book_id
    add_index 'books_locations', :location_id
  end

  def down
    drop_table 'books_locations'
  end
end
