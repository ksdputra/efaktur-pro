module Api
  class UsersController < Api::BaseController
    before_action :authorize_request, except: %i[create authenticate]

    def create
      User.create!(user_params)
      render json: { status: 'OK', message: 'Pendaftaran berhasil' }, status: 201
    end

    def authenticate
      auth_token = Auth::AuthenticateUser.new(auth_params[:identity], auth_params[:password]).call
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

    def upload_p12
      # TODO upload p12
      render json: { status: 'OK', message: 'Digital Certificate telah berhasil diunggah.' }, status: 200
    end

    def input_passphrase
      # TODO untuk mendapatkan apa yang ada di p12
      # yaitu nama dan npwp
      passphrase = params[:passphrase]
      name = RandomNameGenerator.new.compose(3)
      current_user.update(name: "PT #{name}", passphrase: passphrase)
      render json: { status: 'OK', message: 'Passphrase benar.' }, status: 200
    end

    def synchronize
      # TODO untuk masukkan p12 ke dalam aplikasi agent
      # dan mendaftarkan p12 ke aplikasi agent
      render json: { status: 'OK', message: 'Pendaftaran di DJP telah sukses.' }, status: 200
    end

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
