class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.references :artist_data, index: true, foreign_key: true
      t.string :telefone

      t.timestamps null: false
    end
  end
end
