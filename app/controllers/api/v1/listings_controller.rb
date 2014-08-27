class Api::V1::ListingsController < ApplicationController

  before_filter :fetch_listing, :except => [:index, :create]

  def index
    total = Listing.count
    total = total - 10 > 0 ? total - 10 : total

    @listings = Listing.offset(rand(total)).limit(5)

    result = Array.new()
    for listing in @listings
      result.push(filter_listing(listing))
    end

    respond_to do |format|
      format.json { render json: result }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: filter_listing(@listing) }
    end
  end

  private
  def fetch_listing
    @listing = Listing.find_by_id(params[:id])
  end

  private
  def filter_listing(listing)
    hash = Hash.new()
    hash[:id] = listing.id
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
