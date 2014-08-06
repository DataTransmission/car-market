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

  def create
    @photo = Photo.new(create_photo_params)
    respond_to do |format|
      if @photo.save
        format.json { render json: @photo, status: :created }
      else
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def fetch_photo
    @photo = Photo.find_by_id(params[:id])
  end

  private
  def create_photo_params
    params
    .require(:photo)
    .permit(:user_id, :vehicle_id, :url)
  end
end
