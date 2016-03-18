class RemoveColumnHistoriaFromArtistDatas < ActiveRecord::Migration
  def change
    remove_column :artist_datas, :historia, :text
  end
end
