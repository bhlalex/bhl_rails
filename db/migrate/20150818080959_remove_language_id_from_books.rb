class RemoveLanguageIdFromBooks < ActiveRecord::Migration
  def up
    remove_column :books, :language_id
  end

  def down
  end
end
