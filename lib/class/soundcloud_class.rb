class SoundcloudClass

	def initialize(link)
		@link = link
	end

	def valido?
		link = @link.split('/user')
		if link[0] == 'https://soundcloud.com' and @link.length < 38
			return true
		end	
		false
	end
end

