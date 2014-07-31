class Api::V1::VehiclesController < ApplicationController
	def index
		@vehicle = Vehicle.all
		respond_to do |format|
			format.json { render json: @vehicle }
		end
	end

end
