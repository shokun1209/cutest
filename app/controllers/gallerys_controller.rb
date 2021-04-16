class GallerysController < ApplicationController
  def index
    @photos = Photo.all.order('photo_date DESC')
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    redirect_to gallery_path if @photo.destroy
  end
end
