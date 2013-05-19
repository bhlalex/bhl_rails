class User < ActiveRecord::Base
  attr_accessible :active, :email, :guid, :password, :real_name, :username
  has_many :annotations
  has_many :queries
  has_many :books, :through => :users_books
  
  before_create :generate_uuid
  
  private

  def generate_uuid
    self.guid = UUIDTools::UUID.timestamp_create().to_s unless self.guid?
  end
  
end
