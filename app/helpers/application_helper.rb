module ApplicationHelper
  def is_current_user_admin?
    return current_user.is_admin? if logged_in?
    nil
  end
end
