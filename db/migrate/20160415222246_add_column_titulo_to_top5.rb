class AddColumnTituloToTop5 < ActiveRecord::Migration
  def change
    add_column :top5s, :titulo2, :string
    add_column :top5s, :rank2, :integer
    add_column :top5s, :titulo3, :string
    add_column :top5s, :rank3, :integer
    add_column :top5s, :titulo4, :string
    add_column :top5s, :rank4, :integer
    add_column :top5s, :titulo5, :string
    add_column :top5s, :rank5, :integer
  end
end
