class Api::V1::PhotosController < ApplicationController

  before_filter :fetch_photo, :except => [:index, :create]

	def index
		@photos = Photo.all
		respond_to do |format|
			format.json { render json: @photos }
		end
  end

  def show
    respond_to do |format|
      format.json { render json: @photo }
    end
  end

  private
  def fetch_photo
    @photo = Photo.find_by_id(params[:id])
  end
end
