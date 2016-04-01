class Notice < ActiveRecord::Base
  belongs_to :artist_data

  validates :titulo, :noticia, presence: true
end

