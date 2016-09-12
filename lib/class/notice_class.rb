class NoticeClass < DefaultClass
	
	def initialize(link)
		@link = link		
	end

	def url_word
		link = @link.split('-').join(' ')
	end		
end