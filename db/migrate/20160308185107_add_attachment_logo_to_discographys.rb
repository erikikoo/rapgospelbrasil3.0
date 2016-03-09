class AddAttachmentLogoToDiscographys < ActiveRecord::Migration
  def self.up
    change_table :discographys do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :discographys, :logo
  end
end
