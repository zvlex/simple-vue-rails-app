module ApplicationHelper
  FLASH_MESSAGE_TYPES = [:success, :notice, :alert]

  def is_current_user_admin?
    return current_user.is_admin? if logged_in?
    nil
  end

  def markdown(text)
    MarkdownParser.new(text).convert_to_html
  end
end
