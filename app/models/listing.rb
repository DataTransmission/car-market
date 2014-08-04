class Listing < ActiveRecord::Base

	belongs_to :user
	belongs_to :vehicle

	attr_accessor :user, :photos, :vehicle

	def user
		@user = User.find_by_id(self.user_id)
	end

	def photos
		@photos = Photo.where(:vehicle_id => self.vehicle_id).all
	end

	def vehicle
		@vehicle = Vehicle.find_by_id(self.vehicle_id)
	end
end
