class EmailMessage < ActiveRecord::Base
  
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessible :email, :message, :name, :subject
  
  @email_format_re = %r{^(?:[_\+a-z0-9-]+)(\.[_\+a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i
  
  validates :name, :presence => true
  validates :email, :presence => true,
                    :format => @email_format_re
  validates :subject, :presence => true
  validates :message, :presence => true


end
