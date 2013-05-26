class CreateUsersBooksJoin < ActiveRecord::Migration
  def up
    create_table 'user_books', :id => false do |t|
      t.column 'user_id', :integer
      t.column 'book_id', :integer
      
      t.timestamps
    end
    
    add_index 'user_books', :user_id
    add_index 'user_books', :book_id
  end

  def down
    remove_index 'user_books', :user_id
    remove_index 'user_books', :book_id
    drop_table 'user_books'
  end
end
