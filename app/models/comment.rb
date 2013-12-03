class Comment < ActiveRecord::Base
  attr_accessible :collection_id, :comment_id, :number_of_marks, :text, :user_id, :volume_id
end
