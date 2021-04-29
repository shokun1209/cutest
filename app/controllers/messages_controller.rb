class MessagesController < ApplicationController
  before_action :set_photo, only: [:create, :destroy]
  before_action :basic_auth

  def create
    @message = Message.create(message_params)
    if @message.save
      redirect_to photo_path(params[:photo_id])
    else
      @messages = @photo.messages
      render "photos/show"
    end
  end

  def destroy
    @message = Message.find_by(id: params[:id],photo_id: params[:photo_id])
    @message.destroy
    redirect_to photo_path(@photo.id)
  end

  private
  def message_params
    params.require(:message).permit(:name,:text).merge(photo_id: params[:photo_id])
  end

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
