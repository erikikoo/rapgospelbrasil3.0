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

	def get_day(date)
		(((Time.now - date)/3600)/24).to_i
	end
	
	def add_video(video, local)			
		video_desc = video.split('/watch?v=')
		if video_desc[0].length < 24
			video = video_desc[0] + '/embed/' + video_desc[1] 
			if local == 'index' 
			   	raw("<iframe width='330' height='225' src='#{video}' frameborder='0' allowfullscreen ></iframe>")      	    	    
			elsif local == 'show_video'
			   	raw("<iframe width='270' height='225' src='#{video}' frameborder='0' allowfullscreen ></iframe>") 
			end				
		end
    end

    
    def first_name(name)
    	name_frac = name.split(' ')
    	name_frac[0]
    end

    def alert(tipo, msn)
    	
    	raw('<p><span class="alert alert-'+tipo+'" id="mensagem">'+msn+'</span></p>')    			
    end
    
    def set_url(link)
     	if link.include? '-'
			link += '_'		
		else
			link_font = link.split(' ').join('-')
		end			 
	end
	
end
