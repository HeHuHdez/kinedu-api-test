# frozen_string_literal: true

module Api
  # Base class for api controllers
  class BaseApiController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :authorize!

    include Response
    include ExceptionHandler

    private

    def authorize!
      authenticate_or_request_with_http_token do |token|
        @user = User.find_by(auth_token: token, expires_at: Time.zone.now..DateTime::Infinity.new)
      end
    end
  end
end
