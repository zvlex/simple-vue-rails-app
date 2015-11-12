class ApplicationController < ActionController::Base
  before_filter :init_js_data
  before_filter :require_login

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def init_js_data
      gon.is_logged_in = logged_in?
      gon.current_user = UserFrontDataSerializer.new(current_user) if logged_in?
    end

    def not_authenticated
      redirect_to login_path, alert: "Please login first"
    end
end
