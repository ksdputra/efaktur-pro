class Company < ApplicationRecord
  include Filterable, CompanyScope

  belongs_to :user

  validates :npwp, length: { is: 15 }
  validates :name, presence: true, length: { in: 3..50 }
end
