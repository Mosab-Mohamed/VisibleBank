module Api
  module V1
    class BaseController < ActionController::Base
      respond_to :json
      layout 'base'
      
      rescue_from Exception, with: :error_occurred
      
      private
      
      def error_occurred(exception)
        @message = exception.message
        render 'api/v1/shared/empty', status: :internal_server_error
      end
      
      def render_unprocessable
        render 'api/v1/shared/empty', status: :unprocessable_entity
      end
    end
  end
end