module Api
  module Reference
    class CompaniesController < Api::BaseController
      before_action :set_company, only: %i[show update destroy]
      def index
        render json: IndexFacade.new(current_user.id, Company, params).call, status: 200
      end

      def dropdown
        companies = current_user.companies.where(is_dropdown: true).show_dropdown
        render json: { object: companies }, status: 200
      end

      def create
        current_user.companies.create!(company_params)
        render json: { status: 'OK', message: 'Lawan Transaksi berhasil direkam.' }, status: 201
      end

      def show
        render json: { object: @company }, status: 200
      end

      def update
        @company.update!(company_params)
        render json: { status: 'OK', message: 'Lawan Transaksi berhasil diperbaharui.' }, status: 200
      end

      def destroy
        @company.destroy!
        head 204
      end

      private

      def set_company
        @company = current_user.companies.find(params[:id])
      end

      def company_params
        params.permit(
          :npwp,
          :name,
          :address,
          :block,
          :number,
          :rt,
          :rw,
          :village,
          :subdistrict,
          :regency,
          :province,
          :postal_code,
          :phone,
          :is_dropdown
        )
      end
    end
  end
end
