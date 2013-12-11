class EmailMessage < ActiveRecord::Base
  attr_accessible :email, :message, :name, :subject
  
  validates :name, :presence => true
  validates :email, :presence => true
  validates :subject, :presence => true
  validates :message, :presence => true

end
