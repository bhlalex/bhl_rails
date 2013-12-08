class AddDefaultValueToNumberOfMarks < ActiveRecord::Migration
  def up
      change_column :comments, :number_of_marks, :integer, :default => 0
  end
  
  def down
    change_column :comments, :number_of_marks, :integer, :default => nil
  end
end
