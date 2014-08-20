class Vehicle < ActiveRecord::Base

	has_one :listing, dependent: :destroy
	has_many :photos
	belongs_to :user

end
