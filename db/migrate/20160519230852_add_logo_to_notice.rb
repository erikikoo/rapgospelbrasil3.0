class AddLogoToNotice < ActiveRecord::Migration
  def change
    add_column :notices, :logo, :string
  end
end
