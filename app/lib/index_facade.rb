# For more information about how this class works,
# read this article: https://dev.to/kputra/rails-facade-design-pattern-for-index-367d
class IndexFacade
  def initialize(user_id, model, params)
    @user_id = user_id
    @model = model
    @params = params
    @objects = fetch_objects
  end

  attr_reader :user_id, :model, :params, :objects

  def call
    {
      object: objects.show_index,
      page: {
        total_record: objects.count,
        per_page: (params[:per_page] || '20').to_i
      }
    }
  end

  private

  def fetch_objects
    model.where(user_id: user_id).fetch_index(params)
  end
end
