class CommentsController < ApplicationController

  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  def create
    Comment.create(:user_id => current_user.id, :picture_id => params[:picture_id], :text => params[:comment][:text])
    redirect_to :back
  end

end
