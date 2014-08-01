class Photo < ActiveRecord::Base
	has_one :user
	has_one :vehicle
end
