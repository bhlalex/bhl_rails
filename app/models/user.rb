class User < ActiveRecord::Base
  attr_accessible :active, :email, :guid, :password, :real_name, :username, 
                  :verification_code, :verified_date, :created_at, :last_login
  has_many :annotations
  has_many :queries
  has_many :books, :through => :users_books
  
  before_create :generate_uuid
  
  # these are not model variables 
  attr_accessor :entered_password, :entered_password_confirmation, :email_confirmation
  attr_accessible :entered_password, :entered_password_confirmation, :email_confirmation
   
  @email_format_re = %r{^(?:[_\+a-z0-9-]+)(\.[_\+a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i
  
  # Validations
  validates :entered_password, :presence => true,
                               :confirmation => true,
                               :length => {:within => 4..16},
                               :if => :entered_password # only validate if password changed!
  validates :email, :presence => true,
                    :confirmation => true,
                    :format => @email_format_re,
                    :uniqueness => { :case_sensitive => false }
                      
  validates :username, :presence => true,
                       :length => {:within => 4..16},
                       :uniqueness => { :case_sensitive => false }
                         
  validates_presence_of :real_name
#  validate :ensure_unique_username
#  validate :ensure_unique_email
  
  # encrypt password in the database
  before_create :encrypt_password
  before_create :generate_activation_code
  
  before_update :update_password
  
  def self.hash_password(pwd)
    Digest::MD5.hexdigest(pwd)
  end
  
#  def ensure_unique_username
#    errors.add('username', I18n.t(:username_taken, :name => username)) unless unique_user?('username', username, id)
#  end
#  
#  def ensure_unique_email
#    errors.add('email', I18n.t(:email_taken, :email => email)) unless unique_user?('email', email, id)
#  end
  
  def self.authenticate(username, password)
    return nil if username.nil? || password.nil?
    self.find_by_username_and_password(username, self.hash_password(password))
  end
  
  def change_activation_code
    self.verification_code = generate_activation_code
    self.save
  end
  
  def activate
    self.active = 1
    self.verified_date = Time.now
    self.save
  end
  
  private
  
  # returns true or false indicating if field_name is unique
#  def unique_user?(field_name, field_value, id = nil)
#    if id.nil?
#      User.count(:conditions => ["#{field_name} = ?", field_value]) == 0
#    else
#      User.count(:conditions => ["#{field_name} = ? AND id <> ?", field_value, id]) == 0
#    end
#  end
  
  def generate_uuid
    self.guid = UUIDTools::UUID.timestamp_create().to_s unless self.guid?
  end
  
  def generate_activation_code
    characters = ('a'..'z').to_a + ('0'..'9').to_a
    self.verification_code = SecureRandom.random_bytes(20).each_char.map do |char|
      characters[(char.ord % characters.length)]
    end.join
  end
  
  # Callback before_save and before_update we only encrypt password if someone has entered a valid password
  def encrypt_password
    if self.valid? && ! self.entered_password.blank?
      self.password = User.hash_password(self.entered_password)
    else
      return true # encryption not required but we don't want to halt the process
    end
  end
  
  def update_password
    encrypt_password unless self.entered_password.blank?
  end
end
