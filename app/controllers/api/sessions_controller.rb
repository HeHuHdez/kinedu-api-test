# frozen_string_literal: true

module Api
  # Sessions controller
  class SessionsController < Api::BaseApiController
    skip_before_action :authorize!

    def create
      user = User.find_by(email: params[:email].downcase)
      if user&.authenticate(params[:password])
        user.regenerate_auth_token if user.token_expired?
        json_response(user)
      else
        json_response({ message: 'Bad credentials' }, :unauthorized)
      end
    end
  end
end
