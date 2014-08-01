class Vehicle < ActiveRecord::Base
	has_one :user
	has_many :photo
	attr_accessor :owner 

	def owner
		@owner = User.find_by_id(self.user_id)
	end
end
