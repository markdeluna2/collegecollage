class CollegesController < ApplicationController
  def new
  end
  
  def index
    @newphoto=Photo.new
  end

end
