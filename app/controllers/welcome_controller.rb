class WelcomeController < ApplicationController
  def index  	
  end

  def noticia
  	@notices = Notice.order(created_at: :desc)
    
  	render 'notices/index'
  end

  def palavra
  	@words = Word.order(created_at: :desc)
  	render 'words/index'
  end

  def artista
    @artist_data = ArtistData.where(:aprovado => true 'AND' :bloqueado => false "AND nome IS NOT ?" nil)
    render 'artist_datas/index'
  end

  
end
