class RemoveIntegerFromBookViews < ActiveRecord::Migration
  def up
    remove_column :book_views, :integer
  end

  def down
    add_column :book_views, :integer, :integer
  end
end
