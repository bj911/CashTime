class PicturesController < ApplicationController
  require 'will_paginate/array'

  def list_category
    @pictures = Picture.find_all_by_category(params[:category]).paginate(:page => params[:page], :per_page => 5)
  end

  def list_id
    @picture=Picture.find_by_id(params[:id])
    @comments = Comment.all
  end

  def pict_like
    @pictures = Picture.order("count_like DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def like_set
    if Like.find_by_user_id_and_picture_id(current_user.id, params[:picture_id])==nil
      Like.create(:user_id => current_user.id, :picture_id => params[:picture_id])
      Picture.find_by_id(params[:picture_id]).update_attributes(:user_id => current_user.id,
                                                                :count_like => (Picture.find_by_id(params[:picture_id]).count_like+1))
      Event.create(:user_id => current_user.id,
                   :event_type => 'likes',
                   :info => {:user_name => current_user.email, :time => Time.now, :pict_id => params[:picture_id]})
    end
    redirect_to :back
  end

end
