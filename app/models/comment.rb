include ActionView::Helpers::SanitizeHelper

class Comment < ActiveRecord::Base
  attr_accessible :collection_id, :comment_id, :number_of_marks, :text, :user_id, :volume_id, :created_at, :updated_at
  default_scope :order => 'updated_at DESC'
  belongs_to :users
  belongs_to :volumes
  belongs_to :collections
  has_many :replies, :class_name => "Comment",
     :foreign_key => "comment_id"
   belongs_to :parent_comment, :class_name => "Comment",
     :foreign_key => "comment_id"

  validates :text, :presence => true
  
  before_save :sanitize_html

  def sanitize_html
     self.text = sanitize(text, :tags=>[])
   end
end
