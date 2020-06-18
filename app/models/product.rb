class Product < ApplicationRecord
  include Filterable, ProductScope

  belongs_to :user

  validates_presence_of :name, :price
end
