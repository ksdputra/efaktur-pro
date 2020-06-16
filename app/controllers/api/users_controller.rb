module Api
  class UsersController < Api::BaseController
    before_action :authorize_request, except: %i[create authenticate]

    def create
      User.create!(user_params)
      render json: { status: 'OK', message: 'Pendaftaran berhasil' }, status: 201
    end

    def authenticate
      auth_token = Auth::AuthenticateUser.new(auth_params[:email], auth_params[:password]).call_user
      render json: { status: 'OK', message: auth_token }, status: 200
    end

    private

    def user_params
      params.permit(:name, :npwp, :email, :password)
    end

    def auth_params
      params.permit(:email, :password)
    end
  end
end
