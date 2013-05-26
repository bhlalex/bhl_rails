class CreateBooksSubjectsJoin < ActiveRecord::Migration
  def up
    create_table 'book_subjects', :id => false do |t|
      t.column :book_id, :integer
      t.column :subject_id, :integer
      t.column :subject_type_id, :integer
      
      t.timestamps
    end
    
    add_index 'book_subjects', :book_id
    add_index 'book_subjects', :subject_id
    add_index 'book_subjects', :subject_type_id    
  end

  def down
    remove_index 'book_subjects', :book_id
    remove_index 'book_subjects', :subject_id
    remove_index 'book_subjects', :subject_type_id
    
    drop_table 'book_subjects'
  end
end
