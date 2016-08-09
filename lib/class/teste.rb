class Teste
		
	def initialize(video)
		@video = video
	end

	def valido?
		video = @video.split('/watch?v=')
		if video[0].length < 24 and video[0].eql? "https://www.youtube.com" and @video.length <= 60
			return true
		end	
		false
	end

	def tamanho		
		video = @video.split('/watch?v=')
		video[0].length		
	end

	def tamanho_init
		@video.length
	end	


end