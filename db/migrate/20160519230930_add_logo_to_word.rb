class AddLogoToWord < ActiveRecord::Migration
  def change
    add_column :words, :logo, :string
  end
end
