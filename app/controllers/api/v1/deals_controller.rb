class Api::V1::DealsController < ApplicationController
	def index
		@deals = Deal.all
		respond_to do |format|
			format.json { render json: @deals }
		end
	end
end
