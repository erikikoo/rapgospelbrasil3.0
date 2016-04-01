class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.references :artist_data, index: true, foreign_key: true
      t.string :titulo
      t.text :texto

      t.timestamps null: false
    end
  end
end
