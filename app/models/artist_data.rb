class ArtistData < ActiveRecord::Base

	has_many :phones, dependent: :destroy
	has_many :emails, dependent: :destroy
	has_many :discographys, dependent: :destroy
	has_many :commitments, dependent: :destroy
	has_many :videos, dependent: :destroy
	has_one  :history, dependent: :destroy
	has_one  :rede_social, dependent: :destroy

	belongs_to :artist

	accepts_nested_attributes_for :phones, :emails, :history

	#validates :artist_id, uniqueness: true
	validates :nome, presence: true
	
	

  	has_attached_file :logo, styles: { small: "125x100#", medium: "400x250#", thumb: "250x150#" }, default_url: "missing.jpg"
  	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
  	
end
