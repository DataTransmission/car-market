class Api::V1::UsersController < ApplicationController

	before_filter :fetch_user, :except => [:index, :create]
	before_action :api_authenticate, :except => [:signin, :create]

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
				msg = 'user info is updated'
				format.json { render json: msg, status: :ok }
			else
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		respond_to do |format|
			if @user.destroy
				msg = 'user info is deleted'
				format.json { render json: msg, status: :ok }
			else
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def signin

    msg = Hash.new

		if params[:user][:email] == nil
      msg[:status] = 400
	    msg[:message] = 'invalid email'
			return render :json => msg.to_json
		end

		if params[:user][:password] == nil
      msg[:status] = 400
			msg[:message] = 'invalid password'
			return render :json => msg.to_json
		end

		@user = User.find_by_email(params[:user][:email].downcase)

		if @user == nil
			msg[:message] = 'Please sign up first...'
			msg[:status] = 401
		elsif !@user.authenticate(params[:user][:password])
			msg[:message] = 'Wrong password...'
			msg[:status] = 401
		else
			msg[:token] = @user.token.access_token
			msg[:user_id] = @user.id
			msg[:status] = 200
			msg[:message] = 'OK'
		end


		respond_to do |format|
			format.json { render json: msg }
		end
	end

	def signout
		authenticate_or_request_with_http_token do |token, options|
			token = ApiKey.find_by_access_token(token)
			if token != nil
				token.destroy
			end
		end
		msg = Hash.new
		msg[:status] = 200
		msg[:message] = 'OK'
		respond_to do |format|
			format.json { render json: msg }
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
			if ApiKey.exists?(access_token: token)
				ApiKey.find_by_access_token(token).user_id == params[:id].to_i
			else
				false
			end
		end
	end

end
