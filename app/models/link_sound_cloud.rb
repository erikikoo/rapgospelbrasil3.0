class LinkSoundCloud < ActiveRecord::Base
  belongs_to :artist_data

  validates :link, presence: true
end
