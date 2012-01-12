class EventController < ApplicationController

  def events
    @users = User.all
  end

  def info_set
    @events = Event.find_all_by_user_id(params[:user_id])
    @user = User.find_by_id(params[:user_id])
    @info = params[:info]
  end
end
