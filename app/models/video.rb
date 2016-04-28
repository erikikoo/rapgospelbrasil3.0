class Video < ActiveRecord::Base
  belongs_to :artist_data
  belongs_to :artist

  validates :link, presence: true
end
