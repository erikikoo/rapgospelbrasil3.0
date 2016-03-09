class ArtistData < ActiveRecord::Base

	has_many :phones
	has_many :emails

	accepts_nested_attributes_for :phones, :emails

	has_attached_file :logo, styles: {large: "350x350>", medium: "200x200>", thumb: "100x100>" }, default_url: "missing.jpg"
  	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
