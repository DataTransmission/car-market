class Listing < ActiveRecord::Base

	belongs_to :user
	belongs_to :vehicle

	validates(:user_id, presence: true)
	validates(:vehicle_id, presence: true, uniqueness: true)
	validates(:price, presence: true)
	validates(:currency, presence: true)
	validates(:status, presence: true)
	validates(:city, presence: true)
	validates(:state, presence: true)
	validates(:country, presence: true)
	validates(:zip_code, presence: true)
	validates(:description, presence: true)

end
