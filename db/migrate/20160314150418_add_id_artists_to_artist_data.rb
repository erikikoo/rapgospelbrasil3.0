class AddIdArtistsToArtistData < ActiveRecord::Migration
  def change
    add_reference :artist_datas, :artist, index: true, foreign_key: true
  end
end
