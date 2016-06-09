class WelcomeController < ApplicationController
  def index  	
    @noticia = Notice.last
    @palavras = Word.order(created_at: :desc)
    @top5 = Top5.last
    @artistas = ArtistData.where(aprovado: true, bloqueado: false).order(created_at: :desc).limit(5)
   
    @video = Video.where('artist_id = ? OR artist_id = ?', 1, 2).last    
  end
 
  def red_index
    redirect_to root_path
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
    @artist_data = ArtistData.where(aprovado: true, bloqueado: false)    
    render 'artist_datas/index'
  end

  def video
    @videos = Video.where('artist_id = ? OR artist_id = ?', 1, 2)
    render 'videos/index'
  end
  
  def contato
  end

  def envia_contato     
    if Contato.sample_email(params[:form_contato]).deliver_now
      @status = 'success'      
      render :contato
    else
      @status = 'danger'
      render :contato
    end
  end  

  def quem_somos
  end

  def termo_de_uso
    render 'welcome/pags_index/termo_de_uso'
  end  
  
end
