class CreatePagesNamesJoin < ActiveRecord::Migration
  def up
    create_table 'page_names', :id => false do |t|
      t.column 'page_id', :integer
      t.column 'name_id', :integer
      t.column 'namestring', :string
      t.column 'name_found', :string
      
      t.timestamps
    end
    
    add_index 'page_names', :page_id
    add_index 'page_names', :name_id
  end

  def down
    remove_index 'page_names', :page_id
    remove_index 'page_names', :name_id
    drop_table 'page_names'
  end
end
