class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :book_collections
  has_many :books, :through => :book_collections
  has_many :comments
  # status = false ===> priavte
  # status = true ===> public
  attr_accessible :creation_date, :description, :last_modified_date, :status, :title, :user_id, :photo_name
  validates :title, :presence => true,
                       :length => {:within => 4..25}
  mount_uploader :photo_name, ImageUploader
end