class Phone < ActiveRecord::Base
  belongs_to :artist_data

  validates :telefone, presence: true
  
  validates_length_of :telefone, :in => 14..15
end
