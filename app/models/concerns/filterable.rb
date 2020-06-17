# For more information about how this module works,
# read this article: https://dev.to/kputra/rails-refactor-your-where-method-5b10
module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end
