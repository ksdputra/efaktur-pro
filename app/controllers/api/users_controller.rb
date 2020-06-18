module Api
  class UsersController < Api::BaseController
    before_action :authorize_request, except: %i[create authenticate]

    def create
      User.create!(user_params)
      render json: { status: 'OK', message: 'Pendaftaran berhasil' }, status: 201
    end

    def authenticate
      auth_token = Auth::AuthenticateUser.new(auth_params[:identity], auth_params[:password]).call_user
      render json: { status: 'OK', message: auth_token }, status: 200
    end

    def update
      current_user.update!(update_params)
      render json: { status: 'OK', message: 'Profil berhasil diperbaharui.' }, status: 200
    end

    # TODO upload digcert dan masukkan p12 pasphrase
    # bahas apakah setelah signup perlu aktivasi melalui email,
    # sehingga memasukkan digcert dan completion profile
    # dilakukan ketika aktivasi.

    private

    def user_params
      params.permit(:npwp, :email, :password)
    end

    def auth_params
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
