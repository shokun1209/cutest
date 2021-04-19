class GallerysController < ApplicationController
  def index
    @photos = Photo.where(content_type:"image").order('photo_date DESC')
    @q = Photo.ransack(params[:q])
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    redirect_to action: :index if @photo.destroy
  end

  def search
    @q = Photo.ransack(params[:q])
    @photos = @q.result.order('photo_date DESC')
  end
end
