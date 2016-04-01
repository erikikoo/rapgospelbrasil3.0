class Email < ActiveRecord::Base
  belongs_to :artist_data

  validates :email, presence: true
  validates :email, format: {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end
