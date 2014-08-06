class Api::V1::DealsController < ApplicationController
  before_filter :fetch_deal, :except => [:index, :create]

  def index
		@deals = Deal.all
		respond_to do |format|
			format.json { render json: @deals }
		end
  end

  def show
    respond_to do |format|
      format.json { render json: @deal }
    end
  end

  private
  def fetch_deal
    @deal = Deal.find_by_id(params[:id])
  end
end
