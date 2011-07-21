class PagesController < ApplicationController
  def home
    if signed_in?
    @photos=College.find(current_user.college_id).photos.order("created_at DESC").page(params[:page]).per(20)
    @list=College.find(current_user.college_id).name.split[0]
    @newphoto=Photo.new
    end
  end

  def contact
    @newphoto=Photo.new
  end

  def about
    @newphoto=Photo.new
  end

end


#problem with photos upload from any page maybe def new variable but then miht not upload properly