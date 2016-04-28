class RenameColumnToTop5 < ActiveRecord::Migration
  def change
  	rename_column :top5s, :rank, :artista
  	rename_column :top5s, :rank2, :artista2
  	rename_column :top5s, :rank3, :artista3
  	rename_column :top5s, :rank4, :artista4
  	rename_column :top5s, :rank5, :artista5
  end
end
