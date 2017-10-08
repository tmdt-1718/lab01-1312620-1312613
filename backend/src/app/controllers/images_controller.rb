class ImagesController < ApplicationController
  before_action :authenticate, only: [:new, :create]
  before_action :authorize_album, only: [:new, :create]

  def new
    user = current_user;
    album = user.albums.find params[:album_id]
  rescue ActiveRecord::RecordNotFound => e
    redirect_to albums_path
  rescue => e
    render file: 'public/500'
  end

  def create
    user = current_user
    album = user.albums.find params[:album_id]
    image = album.images.build image_params
    image.user = user
    image.save!
    redirect_to album_path(params[:album_id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to albums_path
  rescue ActiveRecord::RecordNotSaved => e
    redirect_to album_images_path(params[:album_id])
  rescue => e
    render file: 'public/500'
  end

  def destroy
    user = current_user
    album = user.albums.find params[:album_id]
    image = album.images.find params[:id]
    image.destroy!
    redirect_to album_path(params[:album_id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to albums_path
  rescue ActiveRecord::RecordNotDestroyed => e
    render file: 'public/500'
  rescue => e
    render file: 'public/500'
  end

  protected
  def authorize_album
    user = current_user
    album = Album.find params[:album_id]
    render file: 'public/401' unless album.user == user
  end

  private
  def image_params
    params.require(:image).permit(:source)
  end
end
