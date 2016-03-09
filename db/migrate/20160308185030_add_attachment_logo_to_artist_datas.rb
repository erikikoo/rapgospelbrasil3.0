class AddAttachmentLogoToArtistDatas < ActiveRecord::Migration
  def self.up
    change_table :artist_datas do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :artist_datas, :logo
  end
end
