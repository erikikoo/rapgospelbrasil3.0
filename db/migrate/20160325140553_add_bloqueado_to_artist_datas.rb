class AddBloqueadoToArtistDatas < ActiveRecord::Migration
  def change
    add_column :artist_datas, :bloqueado, :boolean, default: false
  end
end
