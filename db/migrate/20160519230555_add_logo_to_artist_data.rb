class AddLogoToArtistData < ActiveRecord::Migration
  def change
    add_column :artist_datas, :logo, :string
  end
end
