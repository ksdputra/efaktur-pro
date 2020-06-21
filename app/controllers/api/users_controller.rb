module Api
  class UsersController < Api::BaseController
    before_action :authorize_request, except: %i[create authenticate]

    def create
      CreateUserCommand.new(signup_params).save!
      render json: { status: 'OK', message: 'Pendaftaran berhasil' }, status: 201
    end

    def authenticate
      auth_token = Auth::AuthenticateUser.new(signin_params[:identity], signin_params[:password]).call
      render json: { status: 'OK', message: auth_token }, status: 200
    end

    def index
      object = current_user.show
      render json: { object: object }, status: 200
    end

    def update
      current_user.update!(update_params)
      render json: { status: 'OK', message: 'Profil berhasil diperbaharui.' }, status: 200
    end

    private

    def signup_params
      params.permit(
        :npwp,
        :email,
        :password,
        :address,
        :city,
        :postal_code,
        :phone,
        :fax,
        :cellphone,
        :signer,
        :position,
        :initial_fiscal_year,
        :final_fiscal_year
      )
    end

    def signin_params
      params.permit(:identity, :password)
    end

    def update_params
      params.permit(
        :address,
        :city,
        :postal_code,
        :phone,
        :fax,
        :cellphone,
        :signer,
        :position,
        :initial_fiscal_year,
        :final_fiscal_year
      )
    end
  end
end
