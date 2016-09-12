class ArtistClass
	def initialize(link)
		@link = link
	end
	
	def get_name_artist_url
		link = @link.split(' ').join('-')
	end

	def get_name_artist
		link = @link.split('-').join(' ')
	end
	
end