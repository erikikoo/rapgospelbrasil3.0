class ContactsController < ApplicationController

	def new
		@contact = Contact.new
		respond_to do |format|
			format.js {render '/welcome/contato'}
		end
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
			@status = 'success'
			@action = 'create'
			render 'welcome/pags_index/checkout'
		else
			@status = 'danger'
			@action = 'create'
			respond_to do |format|
				format.js {render '/welcome/contato'}
			end
		end
	end
end


