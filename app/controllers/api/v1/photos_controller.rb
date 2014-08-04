class Api::V1::PhotosController < ApplicationController
	def index
		@photos = Photo.all
		respond_to do |format|
			format.json { render json: @photos }
		end
	end
end
