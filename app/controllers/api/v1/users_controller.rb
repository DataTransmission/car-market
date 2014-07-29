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
		@user = User.new(create_user_params)
		respond_to do |format|
			if @user.save
				format.json { render json: @user, status: :created }
			else
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
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
	def create_user_params
		params
		.require(:user)
		.permit(:first_name, :last_name, :nickname, 
			:email, :status,
			:password, :password_confirmation)
	end
	end

	private
	def fetch_user
		@user = User.find_by_id(params[:id])
	end

end
