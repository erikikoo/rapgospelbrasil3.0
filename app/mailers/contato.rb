class Contato < ApplicationMailer
	default from: "erikikoo@hotmail.com"

	def sample_email(contato)
		@nome = contato[:nome]
		@contato = contato[:email]
		mail(to: @nome, subject: @contato)
	end

end
