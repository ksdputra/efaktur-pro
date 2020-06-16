module Api
  class BaseController < ActionController::API
    include ExceptionHandler

    before_action :authorize_request

    attr_reader :current_user

    def authorize_request
      @current_user = Auth::AuthorizeApiRequest.new(request.headers).call_user[:user]
    end
  end
end
