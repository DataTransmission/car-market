class Photo < ActiveRecord::Base
	has_one :user
	has_one :vehicle
	belongs_to :user
	belongs_to :vehicle
	attr_accessor :user, :vehicle

	def user
		@user = User.find_by_id(self.user_id)
	end

	def vehicle
		@vehicle = Vehicle.find_by_id(self.vehicle_id)
	end
end
