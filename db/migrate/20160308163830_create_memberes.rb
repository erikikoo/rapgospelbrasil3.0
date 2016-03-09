class CreateMemberes < ActiveRecord::Migration
  def change
    create_table :memberes do |t|
      t.references :artist_data, index: true, foreign_key: true
      t.string :nome

      t.timestamps null: false
    end
  end
end
