module Auth
  class AuthenticateUser
    def initialize(email, password)
      @email = email
      @password = password
    end

    def call_user
      Auth::JsonWebToken.encode(user_id: user.id) if user
    end

    private

    attr_reader :email, :password

    def user
      user = User.find_by(email: email)
      return user if user &.authenticate(password)

      raise ExceptionHandler::AuthenticationError, Message.invalid_credentials
    end
  end
end
