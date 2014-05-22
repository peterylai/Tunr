class PurchasesController < ApplicationController

  def create
    @song = Song.find(params[:song_id])
    if current_user.purchase(@song)
      redirect_to user_songs_path(current_user)
    else
      redirect_to artist_path(@song.artist)
    end
  end

end