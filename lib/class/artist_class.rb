class ArtistClass	
	def initialize(link)
		@link = link
	end

	def get_name_artist_url						
		if @link.include? '-'
			link_font = @link.sub(/[-]/,'-/')
		else
			link_font = @link.split(' ').join('-')
		end

	end

	def get_name_artist						
		if @link.include? '_'			
			link = @link.split('_').join('-')
		else
			link = @link.split('-').join(' ')			
		end	
	end	
end