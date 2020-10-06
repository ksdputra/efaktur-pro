class ProductList < ApplicationRecord
  belongs_to :sales_invoice, optional: true
end
