class Photo < ActiveRecord::Base
	has_one :user
	has_one :vehicle
	attr_accessor :user, :vehicle

	def user
		@user = User.find_by_id(self.user_id)
	end

	def vehicle
		@vehicle = User.find_by_id(self.vehicle_id)
	end
end
