class ArtistData < ActiveRecord::Base

	has_many :phones, dependent: :destroy
	has_many :emails, dependent: :destroy
	has_many :discographys, dependent: :destroy
	has_many :commitments, dependent: :destroy
	has_many :videos, dependent: :destroy
	has_one  :history, dependent: :destroy
	has_one  :rede_social, dependent: :destroy

	accepts_nested_attributes_for :phones, :emails, :history

	has_attached_file :logo, styles: {large: "350x350>", medium: "200x200>", thumb: "100x100>" }, default_url: "missing.jpg"
  	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  	
end
