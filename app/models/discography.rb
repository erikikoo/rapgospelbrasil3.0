class Discography < ActiveRecord::Base
  belongs_to :artist_data
  validates :nome, presence: true
  
  has_attached_file :logo, styles: { large: "350x350>", medium: "200x200>", thumb: "100x100>" }, default_url: "cd_missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
