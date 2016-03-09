class CreateArtistDatas < ActiveRecord::Migration
  def change
    create_table :artist_datas do |t|
      t.string :nome
      t.text :historia

      t.timestamps null: false
    end
  end
end
