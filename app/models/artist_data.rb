class ArtistData < ActiveRecord::Base

	has_many :phones, dependent: :destroy
	has_many :emails, dependent: :destroy
	has_many :discographys, dependent: :destroy
	has_many :commitments, dependent: :destroy
	has_many :videos, dependent: :destroy
	has_one :like, dependent: :destroy
	has_one  :link_sound_cloud, dependent: :destroy
	has_one  :history, dependent: :destroy
	has_one  :rede_social, dependent: :destroy


	belongs_to :artist

	accepts_nested_attributes_for :phones, :emails, :history

	#validates :artist_id, uniqueness: true
	validates :nome, presence: true
	
	
	mount_uploader :logo, LogoUploader
  	
  	
end
