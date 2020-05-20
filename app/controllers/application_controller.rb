class ApplicationController < ActionController::Base

    def get_user_token
        if request.headers['x-auth-token'].present?
          token = request.headers['x-auth-token']
          puts @token + " TOKEN"
          puts JsonWebToken.decode(token)
          decoded = JsonWebToken.decode(token)
          puts decoded + " id"
          user_id = decoded[0]['user']['id']

          @current_user = User.find(user_id)

         else
          render json: { msg: "Token is not valid" }, status: :unauthorized
        end
      end
end
