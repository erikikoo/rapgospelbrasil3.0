class EventosController < ApplicationController
	layout 'welcome'

	def new
		@event = Evento.new
		respond_to do |format|
			format.html {render '/welcome/paginas_index/envie_noticias'}
		end
	end

	def create
		@event = Evento.new(params[:evento])
		@event.request = request
		if @event.deliver
			@status = 'success'
			@action = 'create'
			@location = 'evento'
			render 'welcome/pags_index/checkout'
		else
			@status = 'danger'
			@action = 'create'
			@location = 'evento'
			respond_to do |format|
				format.js {render '/welcome/pags_index/event'}
			end
		end
	end
end


