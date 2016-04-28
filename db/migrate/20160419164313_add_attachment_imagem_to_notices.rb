class AddAttachmentImagemToNotices < ActiveRecord::Migration
  def self.up
    change_table :notices do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :notices, :imagem
  end
end
