class Evento < MailForm::Base
	attribute :nome,  		:validate => true
	attribute :email, 		:validate => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	attribute :assunto, 	:validate => true
	attribute :mensagem,	:validate => true

	def headers
		{
			:subject => 'Contato do Portal RapGospelBrasil',
			#:to 	 => 'portalrapgospelbrasil@gmail.com',
			:to 	 => 'erikikoo@hotmail.com',
			:from	 => %("#{nome}" <#{email}>)	
		}
	end
end