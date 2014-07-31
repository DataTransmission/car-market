class Api::V1::VehiclesController < ApplicationController

	before_filter :fetch_vehicle, :except => [:index, :create]

	def index
		@vehicle = Vehicle.all
		respond_to do |format|
			format.json { render json: @vehicle }
		end
	end

	private
    def fetch_vehicle
    	@vehicle = Vehicle.find_by_id(params[:id])
    end
end
