module ApiFlashcards
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_filter :authenticate_basic

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
