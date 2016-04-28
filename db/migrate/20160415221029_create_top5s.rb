class CreateTop5s < ActiveRecord::Migration
  def change
    create_table :top5s do |t|
      t.references :artist, index: true, foreign_key: true
      t.string :titulo
      t.integer :rank

      t.timestamps null: false
    end
  end
end
