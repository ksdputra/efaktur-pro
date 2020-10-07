class UploadSalesInvoiceCommand
  def initialize(current_user, sales_invoice)
    @current_user = current_user
    @sales_invoice = sales_invoice
  end

  def call
    # TODO dummy upload
    @sales_invoice.approval_status_code = '2'
    @sales_invoice.approval_status = 'Approval Sukses'
    @sales_invoice.approval_date = Time.now.utc + 7.hours
    @sales_invoice.description = 'Approval Sukses'
    @sales_invoice.signer = @current_user.signer
    @sales_invoice.save!
  end
end