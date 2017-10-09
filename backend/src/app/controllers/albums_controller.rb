class AlbumsController < ApplicationController
  before_action :authenticate, only: [:new, :create]

  def index
    @albums = Album.all
  end

  def new
  end

  def show
    @album = Album.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    redirect_to albums_path
  rescue => e
    render file: 'public/500'
  end

  def create
    user = current_user
    article = user.albums.create! album_params
    redirect_to albums_path
  rescue ActiveRecord::RecordNotSaved => e
    redirect_to new_album_path
  rescue => e
    render file: 'public/500'
  end

  private
  def album_params
    params.require(:album).permit(:cover)
  end
end
