class User < ActiveRecord::Base

	has_one :api_key, dependent: :destroy
	has_many :vehicle
	has_many :photo
	has_many :listing

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

	# Create getter and setter for class level User
	# class << self; 
	# 	attr_accessor :token_status 
	# end
	# @token_status = 'old' # {new|old|expired}
	# ===================================

	# Create getter and setter for an instance of User
	attr_accessor :token, :vehicles, :photos, :listings #, :token_status

	def token
		@token = ApiKey.find_by_user_id(self.id)
		if @token == nil
				return ApiKey.create!(user: self)
		else
				return @token
		end
	end

	# def token_status
	#
	# 	if @token.present?
	# 		@token_status = 'exist'
	# 	else
	# 		@token = ApiKey.find_by_user_id(self.id)
	# 		if @token.present?
	# 			@token_status = 'exist'
	# 		else
	# 			@token_status = 'empty'
	# 		end
	# 	end
	# end

	def vehicles
		@vehicles = Vehicle.where(:user_id => self.id).all
	end

	def photos
		@photos = Photo.where(:user_id => self.id).all
	end

	def listings
		@listings = Listing.where(:user_id => self.id).all
	end

	private
	def create_api_key
		return ApiKey.create!(user: self)
	end
end
