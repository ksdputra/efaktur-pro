class CreateSalesInvoiceCommand
  include Fakturable

  def initialize(current_user, params)
    @current_user = current_user
    @sales_invoice = current_user.sales_invoices.new(params)
    @nofa = current_user.nofas.find_by(is_active: true)
  end

  def save!
    check_nofa_availability if @sales_invoice.tax_type_code == '0'
    @sales_invoice.fk_id = protocol_pengganti if @sales_invoice.tax_type_code == '1'
    add_more_informations
    deleting_nofa if @sales_invoice.tax_type_code == '0'
  end

  def check_nofa_availability
    faktur = @current_user.sales_invoices.find_by(nofa: @sales_invoice.nofa)
    raise ExceptionHandler::CantDoAction, 'Nomor faktur telah digunakan' unless faktur.nil?

    raise ExceptionHandler::CantDoAction, 'Range NSFP belum direkam/diaktifkan' unless nofa_recorded_or_activated
  end

  def nofa_recorded_or_activated
    @nofa.payload.include?(@sales_invoice.nofa)
  end

  def protocol_pengganti
    faktur = @current_user.sales_invoices.find_by(nofa: @sales_invoice.nofa,
                                                  faktur_status_code: '1',
                                                  approval_status_code: '2')
    raise ExceptionHandler::CantDoAction, 'Faktur yang akan diganti tidak ditemukan' unless faktur
    faktur.faktur_status_code = '0'
    faktur.faktur_status = 'Diganti'
    faktur.user_pengubah = @current_user.signer
    faktur.tanggal_ubah = Time.now.utc + 7.hours
    faktur.save!
    return faktur.id
  end

  def add_more_informations
    @sales_invoice.detail_transaction = DETAIL_TRANSACTION[@sales_invoice.detail_transaction_code]
    @sales_invoice.additional_information = ADDITIONAL_INFORMATION[@sales_invoice.additional_information_code]
    @sales_invoice.tax_type = TAX_TYPE[@sales_invoice.tax_type_code]
    @sales_invoice.faktur_status_code = '1'
    @sales_invoice.faktur_status = FAKTUR_STATUS[@sales_invoice.tax_type_code]
    @sales_invoice.approval_status_code = '0'
    @sales_invoice.approval_status = 'Belum Approve'
    @sales_invoice.user_perekam = @current_user.signer
    @sales_invoice.tanggal_rekam = Time.now.utc + 7.hours
    @sales_invoice.save!
  end

  def deleting_nofa
    @nofa.payload.delete(@sales_invoice.nofa)
    @nofa.last_used = @sales_invoice.nofa
    @nofa.save!
  end
end
