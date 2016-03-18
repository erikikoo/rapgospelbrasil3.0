class Commitment < ActiveRecord::Base
  belongs_to :artist_data

  validates  :local, :endereco, :numero, :telefone,  :data, :hora, presence: true
end
