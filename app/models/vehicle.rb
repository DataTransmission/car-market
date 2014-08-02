class Vehicle < ActiveRecord::Base
	has_one :user
	has_many :photo
	attr_accessor :user 

	def user
		@user = User.find_by_id(self.user_id)
	end
end
