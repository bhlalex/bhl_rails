class RenameBookCollectionsToVolumeCollections < ActiveRecord::Migration
  def up
    rename_table :book_collections, :volume_collections
  end

  def down
    rename_table :volume_collections, :book_collections
  end
end
