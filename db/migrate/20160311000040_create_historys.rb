class CreateHistorys < ActiveRecord::Migration
  def change
    create_table :historys do |t|
      t.references :artist_data, index: true, foreign_key: true
      t.text :historia

      t.timestamps null: false
    end
  end
end
