class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.references :artist_data, index: true, foreign_key: true
      t.string :local
      t.string :endereco
      t.string :numero
      t.string :telefone
      t.string :site
      t.date :data
      t.time :hora

      t.timestamps null: false
    end
  end
end
