# Preview all emails at http://localhost:3000/rails/mailers/contato
class ContatoPreview < ActionMailer::Preview
	def sample_mail_preview
    Contato.sample_email(Artist.first)
  end
end
