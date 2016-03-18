class CreateRedeSociais < ActiveRecord::Migration
  def change
    create_table :rede_sociais do |t|
      t.references :artist_data, index: true, foreign_key: true
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :googleplus
      t.string :linkedid

      t.timestamps null: false
    end
  end
end
