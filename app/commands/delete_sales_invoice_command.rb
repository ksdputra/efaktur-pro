class DeleteSalesInvoiceCommand
  include Fakturable

  def initialize(current_user, sales_invoice)
    @current_user = current_user
    @sales_invoice = sales_invoice
  end

  def destroy!
    ActiveRecord::Base.transaction do
      returning_nofa if faktur_normal
      returning_invoice if faktur_pengganti
      @sales_invoice.destroy!
    end
  end

  def faktur_normal
    @sales_invoice.tax_type_code == '0'
  end
  
  def faktur_pengganti
    @sales_invoice.tax_type_code == '1'
  end

  def returning_nofa
    nofas = @current_user.nofas.where(is_expired: false)
    nofas.each do |nofa|
      if @sales_invoice.nofa.between?(nofa.initial_number, nofa.final_number)
        nofa.payload.push(@sales_invoice.nofa)
        nofa.save!
      end
    end
  end

  def returning_invoice
    faktur = @current_user.sales_invoices.find(@sales_invoice.fk_id)
    faktur.faktur_status_code = '1'
    faktur.faktur_status = FAKTUR_STATUS[faktur.tax_type_code]
    faktur.user_pengubah = @current_user.signer
    faktur.tanggal_ubah = Time.now.utc + 7.hours
    faktur.save!
  end
end
