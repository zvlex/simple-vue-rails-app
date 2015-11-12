# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
class Admin::ApplicationController < Administrate::ApplicationController
  before_filter :authenticate_admin

  def authenticate_admin
    if logged_in?
      unless current_user.is_admin?
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end

  # Override this value to specify the number of elements to display at a time
  # on index pages. Defaults to 20.
  # def records_per_page
  #   params[:per_page] || 20
  # end
end
