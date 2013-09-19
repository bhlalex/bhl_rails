class User < ActiveRecord::Base
  attr_accessible :active, :email, :guid, :password, :real_name, :username, 
                  :verification_code, :verified_date, :created_at, :last_login
  has_many :annotations
  has_many :queries
  has_many :books, :through => :users_books
  
  before_create :generate_uuid
  
  # these are not model variables 
  attr_accessor :password_confirmation, :email_confirmation
  attr_accessible :password_confirmation, :email_confirmation
   
  @email_format_re = %r{^(?:[_\+a-z0-9-]+)(\.[_\+a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i
  
  # Validations
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 4..16},
                       :on => :create,
                       :on => :create && :update
  validates :email, :presence => true,
                    :confirmation => true,
                    :format => @email_format_re,
                    :on => :create && :update
  validates :username, :presence => true,
                       :length => {:within => 4..16},
                       :on => :create && :update
  validates_presence_of :real_name, :on => :create && :update
  validate :ensure_unique_username, :on => :create && :update
  validate :ensure_unique_email, :on => :create && :update
  
  # encrypt password in the database
  before_create :encrypt_password
  before_create :generate_activation_code
  
  before_update :update_password
  
  
  
  
  def self.hash_password(pwd)
    Digest::MD5.hexdigest(pwd)
  end
  
  def ensure_unique_username
    errors.add('username', I18n.t(:username_taken, :name => username)) unless User.unique_user?('username', username, id)
  end
  
  def ensure_unique_email
    errors.add('email', I18n.t(:email_taken, :email => email)) unless User.unique_user?('email', email, id)
  end
  
  # returns true or false indicating if fieldname is unique
  def self.unique_user?(field_name, field_value, id = nil)
    if id.nil?
      User.count(:conditions => ["#{field_name} = ?", field_value]) == 0
    else
      User.count(:conditions => ["#{field_name} = ? AND id <> ?", field_value, id]) == 0
    end
  end
  
  def self.authenticate(username, password)
    return nil if username.nil? || password.nil?
    self.find_by_username_and_password(username, self.hash_password(password))
  end
  
  def change_activation_code
    self.verification_code = generate_activation_code
    self.save
  end
  
  private

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
    if self.valid? && ! self.password.blank?
      self.password = User.hash_password(self.password)
    else
      return true # encryption not required but we don't want to halt the process
    end
  end
  
  def update_password
    encrypt_password if password_changed?
  end
end
