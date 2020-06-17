# For more information about how this class works,
# read this article: https://dev.to/kputra/rails-facade-design-pattern-for-index-367d
class IndexFacade
  def self.call(user_id, model, params)
    objects = model.where(user_id: user_id).search_index(params)

    return {
      object: objects.show_index,
      page: {
        total_record: objects.count,
        per_page: (params[:per_page] ||= '20').to_i
      }
    }
  end
end
