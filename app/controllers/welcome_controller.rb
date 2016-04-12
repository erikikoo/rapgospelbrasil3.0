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
    @artist_data = ArtistData.where("aprovado = ? AND bloqueado = ? AND nome IS NOT ?", true, false, nil)
    render 'artist_datas/index'
  end

  
end
