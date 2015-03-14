module Api
  module Concerns
    module ExceptionsHandling
      extend ActiveSupport::Concern

      included do
        rescue_from Exception, :with => :render_500
        #rescue_from Pundit::NotAuthorizedError, :with => :render_401
        rescue_from ArgumentError, :with => :render_400
        rescue_from ActiveRecord::RecordNotFound, :with => :render_404
      end

      def render_400(exception)
        render :json => { error: exception.message }, :status => 400
      end

      def render_401(exception)
        render :json => { error: exception.message }, :status => 401
      end

      def render_404(exception)
        render :json => { error: exception.message }, :status => 404
      end

      def render_500(exception)
        render :json => { error: exception.message }, :status => 500
      end

    end
  end
end
