class Word < ActiveRecord::Base
  belongs_to :artist_data

  validates :titulo, :texto, presence: true
  
  mount_uploader :logo, LogoUploader
end
