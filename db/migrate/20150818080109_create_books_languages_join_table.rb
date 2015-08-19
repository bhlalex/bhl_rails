class CreateBooksLanguagesJoinTable < ActiveRecord::Migration
  def up
    create_table :book_languages, :id => false do |t|
      t.integer :book_id
      t.integer :language_id
    end

    add_index :book_languages, [:book_id, :language_id]
  end

  def down
    drop_table :book_languages
  end
end