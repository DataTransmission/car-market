class Api::V1::VehiclesController < ApplicationController

	before_filter :fetch_vehicle, :except => [:index, :create]

	def index
		@vehicles = Vehicle.offset(rand(Vehicle.count)).limit(5)
		respond_to do |format|
			format.json { render json: @vehicles }
		end
	end

	def show
		respond_to do |format|
			format.json { render json: @vehicle }
		end
	end

	def show_listing
		respond_to do |format|
			format.json { render json: @vehicle.listing }
		end
	end

	private
    def fetch_vehicle
    	@vehicle = Vehicle.find_by_id(params[:id])
    end

	private
		def create_vehicle_params
			params
			.require(:vehicle)
			.permit(:vin, :manufacturer, :model,
			:year, :color, :user_id)
		end
end
