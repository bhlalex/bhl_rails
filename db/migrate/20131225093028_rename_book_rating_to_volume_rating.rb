class RenameBookRatingToVolumeRating < ActiveRecord::Migration
  def up
    rename_table :book_ratings, :volume_ratings
  end

  def down
    rename_table :volume_ratings, :book_ratings
  end
end
