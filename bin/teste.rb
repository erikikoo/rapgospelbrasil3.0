class Teste
		
	def initialize(video)
		@video = video
	end

	def valido?
		video = @video.split('/watch?v=')
		if video[0].length == 23 and video[0] == 'https://www.youtube.com' and video.length <= 60
			true
		end		
		false
	end

end