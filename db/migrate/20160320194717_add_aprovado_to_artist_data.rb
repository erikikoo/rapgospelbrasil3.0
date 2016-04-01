class AddAprovadoToArtistData < ActiveRecord::Migration
  def change
    add_column :artist_datas, :aprovado, :boolean, default: false
  end
end
