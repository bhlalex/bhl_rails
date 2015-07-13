include ActionView::Helpers::SanitizeHelper

class User < ActiveRecord::Base
  attr_accessible :active, :email, :guid, :password, :real_name, :username,
  :verification_code, :verified_date, :created_at, :last_login, :photo_name, :last_login_language
  has_many :annotations
  has_many :queries
  has_many :books, :through => :users_books
  has_many :histories, :dependent => :destroy
  has_many :book_ratings
  has_many :comments
  has_many :collection_ratings
  has_many :collections
  has_many :public_collections, class_name: "Collection", conditions: { is_public: true }
  before_create :generate_uuid
  mount_uploader :photo_name, ImageUploader
  validate :file_size

  # these are not model variables
  attr_accessor :entered_password, :entered_password_confirmation, :email_confirmation, :old_password
  attr_accessible :entered_password, :entered_password_confirmation, :email_confirmation, :old_password

  @email_format_re = %r{^(?:[_\+a-z0-9-]+)(\.[_\+a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i

  # Validations
  validates :entered_password, :presence => true, :confirmation => true, :length => {:within => 4..16}, :if => :password_validation_required?
  validates :old_password, :presence => true, :on => :update, :if => :change_password_required?
  
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
  
  before_save :sanitize_html
  
  def sanitize_html
    self.username = sanitize(username, :tags=>[])
    self.real_name = sanitize(real_name, :tags=>[])
    self.email = sanitize(email, :tags=>[])
  end




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
    self.find_by_username_and_password_and_active(username, self.hash_password(password), 1)
  end

  def change_activation_code
    self.verification_code = generate_activation_code
    self.save
  end

  def activate
    self.active = 1
    self.verified_date = Time.now
    self.verification_code = ""
    self.save
  end
  
    # validate size of uploaded photo for user profile
  def file_size    
    if !(photo_name.nil?) && !(photo_name.blank?)
      if photo_name.file.size.to_f/(1000*1000) > UPLOADED_PHOTO_MAX_SIZE        
        errors.add(:file, "#{I18n.t(:upload_photo_max_size_error)} #{UPLOADED_PHOTO_MAX_SIZE} #{I18n.t(:mb)}")
      end
    end
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

  def password_validation_required?
  password.blank? || password.nil? || ! self.entered_password.blank? || ! self.entered_password_confirmation.blank?
  end
  
  def change_password_required?
    !entered_password.blank? || !entered_password_confirmation.blank?
  end
end
