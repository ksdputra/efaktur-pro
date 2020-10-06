module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class CantDoAction < StandardError; end
  class MissingRecord < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue_from ExceptionHandler::CantDoAction, with: :four_twenty_two
    rescue_from ExceptionHandler::MissingRecord, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { status: 'Failed', message: e.message }, status: 404
    end
  end

  private

  def four_twenty_two(e)
    render json: { status: 'Failed', message: e.message }, status: 422
  end

  def unauthorized_request(e)
    render json: { status: 'Failed', message: e.message }, status: 401
  end
end
