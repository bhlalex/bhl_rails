class Comment < ActiveRecord::Base
  attr_accessible :collection_id, :comment_id, :number_of_marks, :text, :user_id, :volume_id, :updated_at

  belongs_to :users
  belongs_to :volumes
  belongs_to :collections
  has_many :replies, :class_name => "Comment",
     :foreign_key => "comment_id" ,dependent: :destroy
   belongs_to :parent_comment, :class_name => "Comment",
     :foreign_key => "comment_id"

  validates :text, :presence => true
end
