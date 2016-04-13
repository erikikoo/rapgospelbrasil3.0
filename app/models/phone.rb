class Phone < ActiveRecord::Base
  belongs_to :artist_data

  validates :telefone, presence: true
  validates_format_of :telefone, :with => /[0-9]{8,9}/, :message => 'Número de telefone inválido'
  validates_length_of :telefone, :in => 8..9, :message => 'Número de telefone inválido'
end
