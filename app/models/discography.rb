class Discography < ActiveRecord::Base
  belongs_to :artist_data
  validates :nome, presence: true
  
  has_attached_file :logo, styles: { thumb: "250x150#" }, default_url: "cd_missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
