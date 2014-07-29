class Api::V1::UsersController < ApplicationController

	before_filter :fetch_user, :except => [:index, :create]
	respond_to :json

	def index
		@users = User.all
		render :json => @users.to_json
	end

	def show
		render :json => @user.to_json
	end

	def create
	# render :json => 'Sign Up API is reached...'.to_json
	@user = User.new(user_params)
		if @user.save # Handle a successful save.
			render :json => @user.to_json
		else
			render :json => params[:action].to_json
		end
	end

	def destroy
		@user.destroy
	end

	def update
		if @user.update_attributes(params[:user])
			render :json => 'Updating'.to_json
		end
	end


	private
	def user_params
		params
		.permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
	end

	private
	def fetch_user
		@user = User.find_by_id(params[:id])
	end

end
