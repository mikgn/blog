class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_can_edit_comment?

  def user_can_edit_comment?(comment)
    if user_signed_in? && users_comment?(comment)
      not_too_late_to_edit?(comment)
    end
  end

  private

  def users_comment?(comment)
    comment.user == current_user
  end

  def not_too_late_to_edit?(comment)
    comment.created_at > Time.now - 15.minutes
  end
end
