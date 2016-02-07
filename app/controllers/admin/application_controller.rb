class Admin::ApplicationController < ApplicationController
  skip_before_filter :require_login
  before_filter :admin_only!

  layout 'admin'

  private

    def admin_only!
      return if logged_in? && current_user.is_admin?
      redirect_to root_url
    end
end
