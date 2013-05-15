class CreateBooksAuthorsJoin < ActiveRecord::Migration
  def up
    create_table 'books_authors', :id => false do |t|
      t.column 'book_id', :integer
      t.column 'author_id', :integer
    end
    
    add_index 'books_authors', :book_id
    add_index 'books_authors', :author_id
  end

  def down
    drop_table 'books_authors'
  end
end
