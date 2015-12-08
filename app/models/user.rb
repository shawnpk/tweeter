class User < ActiveRecord::Base

	before_save { self.email = email.downcase }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, 	presence: true, length: { maximum: 50 }
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
						length: { maximum: 255 }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }

	has_secure_password

end
