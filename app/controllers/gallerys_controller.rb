class GallerysController < ApplicationController
  def index
    @photos = Photo.all.order('photo_date DESC')
  end

  def show
    @photo = Photo.find(params[:id])
  end

end
