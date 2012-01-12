class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :add_user_action

  def after_sign_in_path_for(resource)
    Event.create(:user_id => current_user.id,
                 :event_type => "user_sign_in",
                 :info => { :time => Time.now})
    return root_path
  end

  def add_user_action
    @user = current_user
    @user.events.create(
        :user_id => current_user.id,
        :event_type => "navigation",
        :info => {:path => request.fullpath, :type => request.method, :time => Time.now}
    ) if user_signed_in?
  end
end
