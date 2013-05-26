class CreateBooksAuthorsJoin < ActiveRecord::Migration
  def up
    create_table 'book_authors', :id => false do |t|
      t.column 'book_id', :integer
      t.column 'author_id', :integer
      t.column 'is_alternative', :boolean
    end
    
    add_index 'book_authors', :book_id
    add_index 'book_authors', :author_id
  end

  def down
    drop_table 'book_authors'
  end
end
