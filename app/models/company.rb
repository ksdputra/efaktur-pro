class Company < ApplicationRecord
  belongs_to :user

  validates :npwp, length: { is: 15 }
  validates :name, presence: true, length: { in: 3..50 }

  def self.search_index(params)
    order(name: :asc)
      .paginate(page: params[:page], per_page: (params[:per_page] ||= 20))
  end

  def self.show_index
    pluck_all(:id, :npwp, :name, :address, :phone, :is_dropdown)
  end

  def self.show_dropdown
    pluck_all(:id, :npwp, :name, :address)
  end
  
end
