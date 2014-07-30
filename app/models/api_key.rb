class ApiKey < ActiveRecord::Base

	belongs_to :user
	before_create :generate_access_token

	validates :access_token, uniqueness: true
	validates :user_id, uniqueness: true

	private
	def generate_access_token

		self.user_id = user_id
		begin
			self.access_token = SecureRandom.hex
		end while self.class.exists?(access_token: access_token)
	end
end
