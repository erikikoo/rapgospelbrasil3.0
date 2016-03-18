class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :artist_data, index: true, foreign_key: true
      t.string :link

      t.timestamps null: false
    end
  end
end
