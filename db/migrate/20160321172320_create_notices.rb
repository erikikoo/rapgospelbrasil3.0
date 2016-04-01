class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.references :artist_data, index: true, foreign_key: true
      t.text :noticia

      t.timestamps null: false
    end
  end
end
