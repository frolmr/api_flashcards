module ApiFlashcards
  class ApiController < ActionController::API
    attr_reader :current_user
    before_action :authenticate_basic
    include ActionController::HttpAuthentication::Basic::ControllerMethods

    private

    def authenticate_basic
      authenticate_or_request_with_http_basic do |email, passwd|
        auth = User.where(email: email).first
        if auth
          @current_user = auth
        else
          render json: { message: 'Authentication failed' }, status: 401
        end
      end
    end
  end
end
