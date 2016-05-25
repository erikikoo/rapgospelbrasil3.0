class Discography < ActiveRecord::Base
  belongs_to :artist_data
  validates :nome, presence: true
  
 mount_uploader :logo, DiscoUploader
end
