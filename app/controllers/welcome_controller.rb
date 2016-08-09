class WelcomeController < ApplicationController
  def index  	
    @noticia = Notice.last
    @palavras = Word.order(created_at: :desc)    
    @artist_data = ArtistData.where(aprovado: true, bloqueado: false).includes(:likes)
    counter_likes = Like.where(curtido: true).group(:artist_data_id).count    
    @likes = counter_likes.sort_by{|k,v|v}.reverse.to_h    
    @artistas = ArtistData.where(aprovado: true, bloqueado: false).order(created_at: :desc).limit(5)   
    @video_adm = Video.where.not(artist_id: nil).select('link').last        
  end
 
  def red_index
    redirect_to root_path
  end

  def palavra
    @words = Word.order(created_at: :desc)
  end
    
  def noticia
  	@notices = Notice.order(created_at: :desc)
    render 'notices/index'
  end  

  def artista
    @artist_data = ArtistData.where(aprovado: true, bloqueado: false).includes(:likes)
    
    render 'artist_datas/index'
  end

  def video
    @videos = Video.where.not(artist_id: nil).select('link').order(created_at: :desc)
    render 'videos/index'
  end
  
  def contato
  end

  def quem_somos
  end

  def termo_de_uso
    @target = params[:target] unless params[:target].nil?
    render 'welcome/pags_index/termo_de_uso'
  end  

  def politica
    render 'welcome/pags_index/politica_de_privacidade'
  end

  def faq
    render 'welcome/pags_index/faq'
  end

  def faq_integracao
    render 'welcome/pags_index/faq_integracao'
  end

  def faq_cadastro
    render 'welcome/pags_index/faq_cadastro'
  end

  def faq_anuncios
    render 'welcome/pags_index/faq_anuncios'
  end

  def faq_portal
    render 'welcome/pags_index/faq_portal'
  end

  def faq_artistas
    render 'welcome/pags_index/faq_artistas'
  end

  def faq_conteudo
    render 'welcome/pags_index/faq_conteudo'
  end

  
end
