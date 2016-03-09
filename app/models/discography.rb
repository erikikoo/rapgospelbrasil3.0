class Discography < ActiveRecord::Base
  belongs_to :artist_data

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.jpg"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
