class AddImageFlagToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :get_thumbnail_fail, :integer
  end
end
