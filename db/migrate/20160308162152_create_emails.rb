class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.references :artist_data, index: true, foreign_key: true
      t.string :email

      t.timestamps null: false
    end
  end
end
