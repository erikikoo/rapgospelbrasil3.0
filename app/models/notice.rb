class Notice < ActiveRecord::Base
  belongs_to :artist_data

  validates :titulo, :noticia, presence: true

  has_attached_file :imagem, styles: { small: "150x100#", medium: "400x250#", thumb: "250x150#" }
  validates_attachment_content_type :imagem, content_type: /\Aimage\/.*\Z/
end

