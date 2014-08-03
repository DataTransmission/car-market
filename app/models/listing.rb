class Listing < ActiveRecord::Base
	has_one :user
	has_one :vehicle
	belongs_to :user
	belongs_to :vehicle
end
