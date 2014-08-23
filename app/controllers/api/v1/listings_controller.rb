class Api::V1::ListingsController < ApplicationController

  before_filter :fetch_listing, :except => [:index, :create]

	def index
    @listings = Listing.offset(rand(Listing.count)).limit(5)

    result = Array.new()
    for listing in @listings
      hash = Hash.new()
      hash[:price] = listing.price
      hash[:currency] = listing.currency
      hash[:status] = listing.status
      hash[:city] = listing.city
      hash[:state] = listing.state
      hash[:country] = listing.country
      hash[:zip_code] = listing.zip_code
      hash[:description] = listing.description
      hash[:created_at] = listing.created_at
      hash[:updated_at] = listing.updated_at
      hash[:vehicle] = listing.vehicle

      result.push(hash)
    end


		respond_to do |format|
			format.json { render json: result }
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

  private
  def filter_listing(listing)
    hash = Hash.new()
    hash[:price] = listing.price
    hash[:currency] = listing.currency
    hash[:status] = listing.status
    hash[:city] = listing.city
    hash[:state] = listing.state
    hash[:country] = listing.country
    hash[:zip_code] = listing.zip_code
    hash[:description] = listing.description
    hash[:created_at] = listing.created_at
    hash[:updated_at] = listing.updated_at
    hash[:vehicle] = listing.vehicle

    return hash
  end
end
