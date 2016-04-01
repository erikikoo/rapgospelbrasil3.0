module ApplicationHelper

	def sub_texto(texto)
		 if texto.length <= 500
		 	raw(texto)
		 else 
		  	raw(texto[0..500]+" ... ")
		end
	end

	def get_artist_current
    	 @artist_data = ArtistData.find(current_artist.id)
  	end
	
end
