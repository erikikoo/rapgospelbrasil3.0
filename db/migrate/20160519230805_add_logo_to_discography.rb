class AddLogoToDiscography < ActiveRecord::Migration
  def change
    add_column :discographys, :logo, :string
  end
end
