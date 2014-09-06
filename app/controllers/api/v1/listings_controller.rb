class Api::V1::ListingsController < ApplicationController

  before_filter :fetch_listing, :except => [:index, :create]
  before_action :api_authenticate, :except => [:index, :show]

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

  private
  def api_authenticate
    authenticate_or_request_with_http_token do |token, options|
      if ApiKey.exists?(access_token: token)
        ApiKey.find_by_access_token(token).user_id == params[:listing][:user_id].to_i
      else
        false
      end
    end
  end
end
