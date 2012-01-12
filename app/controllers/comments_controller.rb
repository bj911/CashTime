class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    Comment.create(:user_id => current_user.id, :picture_id => params[:picture_id], :text => params[:comment][:text])
    Event.create(:user_id => current_user.id,
                 :event_type => 'comments',
                 :info => {:body => params[:comment][:text], :time => Time.now, :pict_id => params[:picture_id]})
    redirect_to :back
  end

  def comment_date
    @comments = Comment.includes(:picture).paginate(:page => params[:page], :per_page => 5)
  end

end
