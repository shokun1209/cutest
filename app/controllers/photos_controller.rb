class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :destroy]

  def index
  end

  def photo
  end

  def video
  end

  def show
    @message = Message.new
    @messages = @photo.messages
  end

  def destroy
    if @photo.content_type == "image" && @photo.destroy 
      redirect_to action: :photo
    else @photo.destroy
      redirect_to action: :video
    end
  end

  def photo_search
  end

  def video_search
  end

  private
  def set_photo
    @photo = Photo.find(params[:id])
  end

end
