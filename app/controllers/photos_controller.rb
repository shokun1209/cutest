class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :destroy]
  before_action :basic_auth

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
    else @photo.content_type == "video" && @photo.destroy
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

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

end
