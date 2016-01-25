module ApplicationHelper
  FLASH_MESSAGE_TYPES = [:success, :notice, :alert]

  def is_current_user_admin?
    return current_user.is_admin? if logged_in?
    nil
  end

  def markdown(text)
    MarkdownParser.new(text).to_html
  end

  def favorite_glyphicon_button(post)
    if logged_in?
      !current_user.included_in_favorites?(post)
    else
      nil
    end
  end
end
