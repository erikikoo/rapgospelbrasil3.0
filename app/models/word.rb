class Word < ActiveRecord::Base
  belongs_to :artist_data

  validates :titulo, :texto, presence: true
  has_attached_file :imagem, styles: { small: "60x60#", medium: "400x250#", thumb: "250x150#" }
  validates_attachment_content_type :imagem, content_type: /\Aimage\/.*\Z/
end
