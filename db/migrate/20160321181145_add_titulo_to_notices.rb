class AddTituloToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :titulo, :string
  end
end
