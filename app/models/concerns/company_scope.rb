module CompanyScope
  extend ActiveSupport::Concern

  included do
    def self.query(param)
      where('npwp LIKE ? OR lower(name) LIKE ?', '%' + param + '%', '%' + param.downcase + '%')
    end

    def self.fetch_index(params)
      filter(Whitelisting.call(params))
        .order(name: :asc)
        .paginate(page: params[:page], per_page: (params[:per_page] ||= 20))
    end

    def self.show_index
      pluck_all(:id, :npwp, :name, :address, :phone, :is_dropdown)
    end

    def self.show_dropdown
      pluck_all(:id, :npwp, :name)
    end
  end

  class Whitelisting
    def self.call(params)
      params.slice(:query)
    end
  end
end