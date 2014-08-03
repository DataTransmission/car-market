class Vehicle < ActiveRecord::Base
	has_one :user
	has_one :listing, dependent: :destroy
	has_many :photo
	belongs_to :user
	attr_accessor :user, :photos, :listing

	def user
		@user = User.find_by_id(self.user_id)
	end

	def photos
		@photos = Photo.where(:vehicle_id => self.id).all
	end

	def listing
		@listings = Listing.find_by_vehicle_id(self.id)
	end
end
