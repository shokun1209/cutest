class VideosController < ApplicationController
  def index
    @videos = Photo.where(content_type:"video").order('photo_date DESC')
  end

  def show
    @video = Photo.find(params[:id])
  end

  def destroy
    @video = Photo.find(params[:id])
    redirect_to gallerys_path if @photo.destroy
  end
end
