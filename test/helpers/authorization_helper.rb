module AuthorizationHelper
  def token
    Auth::JsonWebToken.encode(user_id: User.first.id)
  end
end
