module Auth
  class JsonWebToken
    # secret to encode and decode token
    # HMAC_SECRET = Rails.application.secrets.secret_key_base
    HMAC_SECRET = Rails.application.credentials.read

    def self.encode(payload, exp = 1.year.from_now)
      # set expiry to 1 year from creation time
      payload[:exp] = exp.to_i
      # sign token with application secret
      JWT.encode(payload, HMAC_SECRET)
    end

    def self.decode(token)
      # get payload; first index in decoded array
      body = JWT.decode(token, HMAC_SECRET)[0]
      HashWithIndifferentAccess.new body
      # rescue from all decode errors
    rescue JWT::DecodeError => e
      # raise custom error to be handled by custom handler
      raise ExceptionHandler::InvalidToken, e.message
    end
  end
end
