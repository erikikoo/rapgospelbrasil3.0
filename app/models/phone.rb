class Phone < ActiveRecord::Base
  belongs_to :artist_data

  validates :telefone, presence: true
end
