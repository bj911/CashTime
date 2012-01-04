class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    return categories_path || root_path
  end

  def logout
    Event.create(:user_id => current_user.id, :signout_at => Time.now)
    sign_out_and_redirect root_path
  end
end
