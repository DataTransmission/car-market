class Api::V1::UsersController < ApplicationController

	before_filter :fetch_user, :except => [:index, :create]
	respond_to :json

	def index
		@users = User.all
		respond_to do |format|
			format.json { render json: @users }
		end
	end

	def show
		respond_to do |format|
			format.json { render json: @user }
		end
	end

	def create
		@user = User.new(create_user_params)
		respond_to do |format|
			if @user.save
				format.json { render json: @user, status: :created }
			else
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @user.update_attributes(update_user_params)
				format.json { head :no_content, status: :ok }
			else
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		respond_to do |format|
			if @user.destroy
				format.json { head :no_content, status: :ok }
			else
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	


	private
	def create_user_params
		params
		.require(:user)
		.permit(:first_name, :last_name, :nickname, 
			:email, :status,
			:password, :password_confirmation)
	end

	private
	def update_user_params
		params
		.require(:user)
		.permit(:first_name, :last_name, :nickname, 
			:email, :status, 
			:password, :password_confirmation)
	end

	private
	def fetch_user
		@user = User.find_by_id(params[:id])
	end

	private
	def api_authenticate
		authenticate_or_request_with_http_token do |token, options|
			ApiKey.exists?(access_token: token)
		end
	end
end
