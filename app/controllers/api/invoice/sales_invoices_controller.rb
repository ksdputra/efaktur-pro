module Api
  module Invoice
    class SalesInvoicesController < Api::BaseController
      before_action :set_sales_invoice, except: %i[index create]
      def index
        render json: IndexFacade.new(current_user.id, SalesInvoice, params).call, status: 200
      end

      def create
        CreateSalesInvoiceCommand.new(current_user, create_sales_invoice_params).save!
        render json: { status: 'OK', message: 'Faktur Pajak Keluaran berhasil direkam' }, status: 201
      end

      def upload
        raise ExceptionHandler::CantDoAction, 'Faktur Pajak Keluaran tidak bisa di-upload' if sales_invoice_already_uploaded

        UploadSalesInvoiceCommand.new(current_user, @sales_invoice).call
        render json: { status: 'OK', message: 'Faktur Pajak Keluaran berhasil di-upload' }, status: 200
      end

      private

      def set_sales_invoice
        @sales_invoice = current_user.sales_invoices.find(params[:id])
      end

      def sales_invoice_already_uploaded
        ['1', '2'].include?(@sales_invoice.approval_status_code)
      end

      def create_sales_invoice_params
        params.permit(
          :npwp,
          :name,
          :address,
          :detail_transaction_code,
          :additional_information_code,
          :tax_type_code,
          :document_date,
          :tax_periode,
          :tax_year,
          :nofa,
          :reference,
          :total_dpp,
          :total_ppn,
          :total_ppnbm,
          :uang_muka_code,
          :uang_muka_dpp,
          :uang_muka_ppn,
          :uang_muka_ppnbm,
          product_lists_attributes: [
            :code,
            :name,
            :price,
            :amount,
            :discount,
            :total_price,
            :dpp,
            :ppn,
            :ppnbm_rate,
            :ppnbm
          ]
        )
      end
    end
  end
end