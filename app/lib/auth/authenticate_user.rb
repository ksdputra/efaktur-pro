module Auth
  class AuthenticateUser
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

    def initialize(identity, password)
      @identity = identity
      @password = password
    end

    def call
      Auth::JsonWebToken.encode(user_id: user.id) if user
    end

    private

    attr_reader :identity, :password

    def user
      user = fetch_user
      return user if user &.authenticate(password)

      raise ExceptionHandler::AuthenticationError, Message.invalid_credentials
    end

    def fetch_user
      if email?
        User.find_by(email: identity)
      else
        User.find_by(npwp: identity)
      end
    end

    def email?
      identity =~ EMAIL_REGEX
    end
  end
end
