class CreateEddressShows < ActiveRecord::Migration
  def change
    create_table :eddress_shows do |t|
      t.references :commitment, index: true, foreign_key: true
      t.string :local
      t.string :endereco
      t.string :numero
      t.string :telefone
      t.string :site

      t.timestamps null: false
    end
  end
end
