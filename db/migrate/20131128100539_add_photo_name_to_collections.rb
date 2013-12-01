class AddPhotoNameToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :photo_name, :string
  end
end
