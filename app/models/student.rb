class Student < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :username, :encrypted_password, :encrypted_password_confirmation, :salt
  has_many :subjects
  
  validates_presence_of  :firstname, :lastname, :username
  validates_uniqueness_of  :username
  validates :encrypted_password, :presence => true,
					   :confirmation => true,
					   :length => {:within => 6..40},
					   :on => :create
  validates :encrypted_password, :confirmation => true,
					   :length => {:within => 6..40},
					   :allow_blank => true,
					   :on => :update
					   

  before_save :encrypt_password
  

  
  


  def has_password?(submitted_password)
	encrypted_password == encrypt(submitted_password)
	

  end
  
  def self.authenticate(username, submitted_password)
	student = find_by_username(username)
	return nil if student.nil?
	return student if student.has_password?(submitted_password)
	
  end
	
 def self.authenticate_with_salt(username, cookie_salt)
    student = find_by_username(username)
    (student && student.salt == cookie_salt) ? student : nil
  end

  	def encrypt_password
      self.salt = make_salt unless has_password?(encrypted_password)
      self.encrypted_password = encrypt(encrypted_password)
    end
  
private


    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{encrypted_password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
					   
end
