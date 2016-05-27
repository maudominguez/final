module SessionsHelper

  def not_equal_to_current_user?(user)
    !user || !signed_in_user || user.id != signed_in_user.id
  end

  def equal_to_current_user?(user)
    return !not_equal_to_current_user?(user)
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def signed_in_user
    if session["user_id"].present?
      User.find_by(id: session["user_id"])
    else
      nil
    end
  end

  def admin_signed_in?
    user = signed_in_user
    user && user.admin
  end

  def log_out
    reset_session
  end

end
