class Commitment < ActiveRecord::Base
  belongs_to :artist_data

  has_many :eddress_shows

  accepts_nested_attributes_for :eddress_shows
end
