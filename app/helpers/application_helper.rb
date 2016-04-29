module ApplicationHelper

	def sub_texto(texto, qnt)
		 if texto.length <= qnt
		 	raw(texto)
		 else 
		  	raw(texto[0..qnt]+" ... ")
		end
	end

	def get_artist_current
    	 @artist_data = ArtistData.find(current_artist.id)
  	end

  	def get_administrador
    	@adm = Artist.find_by(admin: true)
  	end

  	def set_video(video)		
		"<iframe width='560' height='315' src='#{video}' frameborder='0' allowfullscreen></iframe>"
	end

	def get_day(date)
		(((Time.now - date)/3600)/24).to_i
	end
	

	
end
