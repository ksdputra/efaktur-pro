module SalesInvoiceScope
  extend ActiveSupport::Concern

  included do
    def self.fetch_index(params)
      order(created_at: :asc)
        .paginate(page: params[:page], per_page: (params[:per_page] ||= 20))
    end

    def self.show_index
      pluck_all(
        :id,
        :npwp,
        :name,
        'concat(detail_transaction_code, tax_type_code, nofa) AS show_nofa',
        :document_date,
        :tax_periode,
        :tax_year,
        'faktur_status_code AS object_status_code',
        'faktur_status AS object_status',
        '(CASE WHEN uang_muka_code=0 THEN total_dpp ELSE uang_muka_dpp END) AS dpp',
        '(CASE WHEN uang_muka_code=0 THEN total_ppn ELSE uang_muka_ppn END) AS ppn',
        '(CASE WHEN uang_muka_code=0 THEN total_ppnbm ELSE uang_muka_ppnbm END) AS ppnbm',
        :approval_status_code,
        :approval_status,
        :approval_date,
        :description,
        :signer,
        :reference,
        'user_perekam AS created_by',
        'tanggal_rekam AS created_at',
        'user_pengubah AS updated_by',
        'tanggal_ubah AS updated_at'
      )
    end
  end
end