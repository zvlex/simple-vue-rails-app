class ApplicationController < ActionController::Base
  before_filter :init_js_data
  before_filter :require_login

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def init_js_data
      gon.is_logged_in = logged_in?

      if logged_in?
        gon.current_user = UserFrontDataSerializer.new(current_user)
        gon.is_user_banned = !!current_user.deleted_at?
      end
    end

    def not_authenticated
      render json: { alert: t('ui.small_notifications.basic.authentication_error') }
    end
end
