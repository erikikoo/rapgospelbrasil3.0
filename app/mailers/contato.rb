class Contato < ApplicationMailer
	default from: "240382013@eniac.com.br"

	def sample_email(contato)
		@nome = contato[:nome]
		@contato = contato[:email]
		mail(to: @nome, subject: @contato)
	end

end
