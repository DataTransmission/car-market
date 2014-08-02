class Photo < ActiveRecord::Base
	has_one :user
	has_one :vehicle
	attr_accessor :user

	def user
		@user = User.find_by_id(self.user_id)
	end
end
