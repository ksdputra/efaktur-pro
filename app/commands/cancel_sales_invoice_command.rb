class CancelSalesInvoiceCommand
  def initialize(current_user, sales_invoice)
    @current_user = current_user
    @sales_invoice = sales_invoice
  end

  def call
    @sales_invoice.faktur_status_code = '0'
    @sales_invoice.faktur_status = 'Batal'
    @sales_invoice.user_pengubah = @current_user.signer
    @sales_invoice.tanggal_ubah = Time.now.utc + 7.hours
    @sales_invoice.save!
  end
end
