class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :artist_data, index: true, foreign_key: true
      t.string :ip
      t.boolean :like, default: false
      t.boolean :unlike, default: false

      t.timestamps null: false
    end
  end
end
