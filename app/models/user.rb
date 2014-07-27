class User < ActiveRecord::Base
	attr_accessor :email, :name, :password, :password_confirmation
	has_secure_password

	before_save { self.email = email.downcase }

	validates(:first_name, presence: true, length: { maximum: 25 })
	validates(:last_name, presence: true, length: { maximum: 25 })
	validates(:nickname, presence: true, length: { maximum: 25 }, uniqueness: true)

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates(:email, 
		presence: true, 
		format: { with: VALID_EMAIL_REGEX }, 
		uniqueness: { case_sensitive: false })

	validates :password, length: { minimum: 6 }

end
