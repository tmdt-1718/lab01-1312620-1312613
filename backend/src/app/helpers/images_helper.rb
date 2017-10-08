module ImagesHelper
  def authorize_album
    user = current_user
    album = Album.find params[:id]
    album.user == user ? true : false
  end
end
