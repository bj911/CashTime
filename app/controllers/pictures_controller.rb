class PicturesController < ApplicationController
  require 'will_paginate/array'

  def list_id
    Event.create(:user_id => current_user.id, :link => "/categories/#{params[:category]}/#{params[:id]}", :link_at => Time.now)
    @picture=Picture.find_by_id(params[:id])
    @comments = Comment.all
  end

  def list_category
    @pictures = Picture.find_all_by_category(params[:category]).paginate(:page => params[:page], :per_page => 5)
    Event.create(:user_id => current_user.id, :link => "/categories/#{params[:category]}", :link_at => Time.now)
  end

  def info_set
    Event.create(:user_id => current_user.id, :link => "/events/#{params[:info]}/#{params[:user_id]}", :link_at => Time.now)
    @events = Event.find_all_by_user_id(params[:user_id])
    @pictures = Picture.find_all_by_user_id(params[:user_id])
    @comments = Comment.find_all_by_user_id(params[:user_id])
    @likes = Like.find_all_by_user_id(params[:user_id])
    @user = User.find_by_id(params[:user_id])
    @info = params[:info]
  end

  def events
    Event.create(:user_id => current_user.id, :link => "/events", :link_at => Time.now)
    @pictures = Picture.all
    @comments = Comment.all
    @users = User.all
  end

  def categories
    if (Time.now.getutc.to_i-current_user.current_sign_in_at.to_i)<4
      Event.create(:user_id => current_user.id, :signin_at => current_user.current_sign_in_at)
    end
    Event.create(:user_id => current_user.id, :link => "/categories", :link_at => Time.now)
  end

  def comment_date
    Event.create(:user_id => current_user.id, :link => "/categories", :link_at => Time.now)
    @comments = Comment.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def pict_like
    Event.create(:user_id => current_user.id, :link => "/categories", :link_at => Time.now)
    @pictures = Picture.order("count_like DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def like_set
    if Like.find_by_user_id_and_picture_id(current_user.id, params[:picture_id])==nil
      Like.create(:user_id => current_user.id, :picture_id => params[:picture_id])
      Picture.find_by_id(params[:picture_id]).update_attributes(:count_like => (Picture.find_by_id(params[:picture_id]).count_like+1))
    end
    redirect_to :back
  end

  def index
    @pictures = Picture.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  def create
    @picture = Picture.new(params[:picture])

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render json: @picture, status: :created, location: @picture }
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end
end
