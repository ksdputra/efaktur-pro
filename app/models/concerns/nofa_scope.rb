module NofaScope
  extend ActiveSupport::Concern

  included do
    def self.fetch_index(params)
      paginate(page: params[:page], per_page: (params[:per_page] ||= 20))
    end

    def self.show_index
      pluck_all(:id, :initial_number, :final_number, :published_date, :last_used, :is_active)
    end
  end
end
