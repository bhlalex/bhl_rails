class Remove < ActiveRecord::Migration
  def up
    remove_column :collections, :get_thumbnail_fail
  end

  def down
  end
end
