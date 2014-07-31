class User < ActiveRecord::Base

	has_one :api_key, dependent: :destroy
	after_create :create_api_key
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

	validates :password, length: { minimum: 6 }, :on => :create


	# private
	# def set_auth_token
	# 	return if auth_token.present?

	# 	begin
	# 		self.auth_token = SecureRandom.hex
	# 	end while self.class.exists?(auth_token: self.auth_token)
	# end

	# Create getter and setter for class level User
	# class << self; 
	# 	attr_accessor :token_status 
	# end
	# @token_status = 'old' # {new|old|expired}
	# ===================================

	# Create getter and setter for an instance of User
	attr_accessor :token_status 

	def get_or_create_api_key
		token = ApiKey.find_by(user: self)
		if token.present?
			@token_status = 'used'
			return token	
		else
			@token_status = 'new'
			return create_api_key
		end
	end

	private
	def create_api_key
		return ApiKey.create!(user: self)
	end

end
