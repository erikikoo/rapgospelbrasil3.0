class CreateDiscographys < ActiveRecord::Migration
  def change
    create_table :discographys do |t|
      t.references :artist_data, index: true, foreign_key: true
      t.string :nome
      t.date :data

      t.timestamps null: false
    end
  end
end
