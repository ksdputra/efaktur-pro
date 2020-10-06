module Api
  module Reference
    class NofasController < Api::BaseController
      def index
        render json: IndexFacade.new(current_user.id, Nofa, params).call, status: 200
      end

      def create
        CreateNofaCommand.new(current_user, nofa_params).save!
        render json: { status: 'OK', message: 'NSFP berhasil direkam.' }, status: 201
      end

      def activate
        ActivateNofaCommand.new(current_user, params[:id]).activate!
        render json: { status: 'OK', message: 'Nomor Faktur berhasil diaktifkan.' }, status: 200
      end

      private

      def nofa_params
        params.permit(
          :initial_number,
          :final_number,
          :published_date,
        )
      end
    end
  end
end
