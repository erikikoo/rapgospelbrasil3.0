class CreateLinkSoundClouds < ActiveRecord::Migration
  def change
    create_table :link_sound_clouds do |t|
      t.references :artist_data, index: true, foreign_key: true
      t.string :link

      t.timestamps null: false
    end
  end
end
