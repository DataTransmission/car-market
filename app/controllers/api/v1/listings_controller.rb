class Api::V1::ListingsController < ApplicationController

  before_filter :fetch_listing, :except => [:index, :create]

	def index
		@listings = Listing.all
		respond_to do |format|
			format.json { render json: @listings }
		end
  end

  def show
    respond_to do |format|
      format.json { render json: @listing }
    end
  end

  private
  def fetch_listing
    @listing = Listing.find_by_id(params[:id])
  end
end
