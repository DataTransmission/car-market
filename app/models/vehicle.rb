class Vehicle < ActiveRecord::Base

	has_one :listing, dependent: :destroy
	has_many :photos
	belongs_to :user

	validates(:vin, uniqueness: { case_sensitive: false })
	validates(:user_id, presence: true)

end
