class Deal < ActiveRecord::Base
	attr_accessor :user, :listing

	def user
		@user = User.find_by_id(self.user_id)
	end

	def listing
		@listing = Listing.find_by_id(self.listing_id)
	end
end
