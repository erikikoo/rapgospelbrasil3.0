class AddAttachmentImagemToWords < ActiveRecord::Migration
  def self.up
    change_table :words do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :words, :imagem
  end
end
