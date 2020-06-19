class Company < ApplicationRecord
  include Filterable, CompanyScope

  belongs_to :user

  validates :npwp, length: { is: 15 }
  validates :name, length: { in: 3..50 }
  validates :address, length: { in: 3..100 }
end
