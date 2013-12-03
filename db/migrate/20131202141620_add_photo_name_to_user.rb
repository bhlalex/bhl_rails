class AddPhotoNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :photo_name, :string
  end
end
