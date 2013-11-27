class BookViews < ActiveRecord::Migration
  def up
    create_table :book_views, :id => false  do |t|
      t.integer 'book_id1', :integer
      t.integer 'book_id2', :integer
      t.timestamps
    end
  end
  
  def down
    drop_table :book_views
  end
end