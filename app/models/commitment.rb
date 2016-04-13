class Commitment < ActiveRecord::Base
  belongs_to :artist_data

  validates  :local, :endereco, :numero, :telefone,  :data, :hora, presence: true
 
  validates_format_of :telefone, :with => /\d{8,9}/, :message => 'Número de telefone inválido'
  
  validates_length_of :telefone, :in => 8..9, :message => 'Número de telefone inválido'

end
