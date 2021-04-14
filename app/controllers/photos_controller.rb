class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
  end

  private
  def photo_params
    params.require(:photo).permit(:image,:photo_date,:content_type).merge(uploader_id: uploader.id)
  end
  


end
