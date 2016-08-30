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
    render 'words/index'
  end
    
  def noticia
  	@notices = Notice.order(created_at: :desc)
    render 'notices/index'
  end  

  def artista
     @artist_data = ArtistData.where(aprovado: true, bloqueado: false).includes(:likes)
     like_query
     #ransack
     @q = ArtistData.where(aprovado: true, bloqueado: false).ransack(params[:q])
     @artist_data = @q.result
    render 'artist_datas/index'
  end

  def video
    @videos = Video.where.not(artist_id: nil).select('link').order(created_at: :desc)
    render 'videos/index'
  end
  
  def contato
    @contact = Contact.new
    render 'welcome/paginas_index/contato'    
  end

  def quem_somos
    render 'welcome/paginas_index/quem_somos'
  end

  def termo_de_uso
    @target = params[:target] unless params[:target].nil?
    if @target == 'index'
      render 'welcome/paginas_index/termo_de_uso'
    end      
  end  

  def politica
    render 'welcome/paginas_index/politica_de_privacidade'
  end

  def faq
    render 'welcome/paginas_index/faq'
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

  def dicas
    render 'welcome/paginas_index/dica_de_uso'
  end

  def dicas_cadastro
    render 'welcome/pags_index/dicas_cadastro'
  end

  def dicas_perfil
    render 'welcome/pags_index/dicas_perfil'
  end

  def dicas_eventos
    render 'welcome/pags_index/dicas_eventos'
  end

  def dicas_email
    render 'welcome/pags_index/dicas_email'
  end

  def dicas_telefone
    render 'welcome/pags_index/dicas_telefone'
  end

  def dicas_redesocial
    render 'welcome/pags_index/dicas_redesocial'
  end

  def dicas_discografia
    render 'welcome/pags_index/dicas_discografia'
  end

  def dicas_soundcloud
    render 'welcome/pags_index/dicas_soundcloud'
  end

  def dicas_videos
    render 'welcome/pags_index/dicas_videos'
  end

  def teste
    render 'welcome/teste'
  end



  private

  def like_query
      ip = request.remote_ip

      @artist_data = ArtistData.includes(:likes).where(aprovado: true, bloqueado: false)
      @count_per_ip = Like.where(ip: ip).group(:artist_data_id).count     
      @exist_likes = Like.select('curtido, unlike, artist_data_id, ip').where(ip: ip)
    end
  
end
