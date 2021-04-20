class VideosController < ApplicationController
  def index
    @videos = Photo.where(content_type:"video").order('photo_date DESC')
    @q = Photo.ransack(params[:q])
  end

  def show
    @video = Photo.find(params[:id])
  end

  def destroy
    @video = Photo.find(params[:id])
    redirect_to action: :index if @video.destroy
  end

  def search
    @q = Photo.ransack(params[:q])
    @videos = @q.result.order('photo_date DESC')
  end
end
