class JsonWebToken
    @SECRET_KEY = "Secret_Bitch7707"

    def self.encode(payload)
        @expiration = Time.now.to_i + 7200
        JWT.encode payload.merge(exp: @expiration), Rails.application.secrets.secret_key_base
    end

    def self.decode(token)
     JWT.decode token, Rails.application.secrets.secret_key_base
    end

end