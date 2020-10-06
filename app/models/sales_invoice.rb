class SalesInvoice < ApplicationRecord
  include Filterable, SalesInvoiceScope

  has_many :product_lists, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :product_lists, allow_destroy: true
end
