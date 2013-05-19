class CreateUsersBooksJoin < ActiveRecord::Migration
  def up
    create_table 'users_books', :id => false do |t|
      t.column 'user_id', :integer
      t.column 'book_id', :integer
      
      t.timestamps
    end
    
    add_index 'users_books', :user_id
    add_index 'users_books', :book_id
  end

  def down
    remove_index 'users_books', :user_id
    remove_index 'users_books', :book_id
    drop_table 'users_books'
  end
end
