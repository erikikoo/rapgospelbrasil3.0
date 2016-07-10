class RenameColumnLikeinTableLikeToCurtido < ActiveRecord::Migration
  def change
  	rename_column :likes, :like, :curtido
  end
end
