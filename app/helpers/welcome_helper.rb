module WelcomeHelper

	def noticia(texto)
		if texto.length <= 100
		 	raw(texto)
		else 
		  	raw(texto[0..100]+" ... ")
		end
	end

	def palavra(texto)
		 if texto.length <= 300
		 	raw(texto)
		 else 
		  	raw(texto[0..300]+" ... ")
		end
	end

end
