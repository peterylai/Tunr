class AddSpotifyUriToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :spotify_uri, :text
  end
end
