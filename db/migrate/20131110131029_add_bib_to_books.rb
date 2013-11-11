class AddBibToBooks < ActiveRecord::Migration
  def change
    add_column :books, :bibtex, :text
    add_column :books, :endnote, :text
  end
end
