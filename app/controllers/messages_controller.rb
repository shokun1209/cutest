class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    if @message.save
      redirect_to photo_path(params[:photo_id])
    else
      @photo = Photo.find(params[:photo_id])
      @messages = @photo.messages
      render "photos/show"
    end
  end

  private
  def message_params
    params.require(:message).permit(:name,:text).merge(photo_id: params[:photo_id])
  end
end
