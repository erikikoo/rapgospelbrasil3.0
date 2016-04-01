class AdminController < ApplicationController
  before_action :get_model_user  
  before_action :get_admin
  before_action :get_dados_artista, only: [:show_artista, :remove_artista, :aprova_artista,:bloquear_artista, :desbloquear_artista]
  before_action :get_aguardando_aprovado, only: [:index, :artistas,:aprova_artista,:bloquear_artista,:desbloquear_artista]
  before_action :get_bloqueado, only: [:index, :artistas,:aprova_artista,:bloquear_artista,:desbloquear_artista]
  before_action :get_notice_for_id, only: [:edit_noticia, :remove_noticia, :show_noticia]
  before_action :get_word_for_id, only: [:edit_palavra, :remove_palavra, :show_palavra]
  before_action :get_all_notices, only: [:index,:remove_noticia, :success_noticia] 
  before_action :get_all_words, only: [:index, :remove_palavra, :palavras]
  before_action :get_all_artist, only: [:index,:artistas,:remove_artista,:aprova_artista, :bloquear_artista,:desbloquear_artista]
  before_action :get_bloqueado, only: [:index]


  before_action :authenticate_artist!



  def index  	
    @users = Artist.where('admin = ?', 0)
    authorize @users
  end

  def artistas
  	
  end

  def show_artista
    
  end

  def remove_artista
      @artist_data.destroy
      render :artistas  
  end

  def aprova_artista
    @artist_data.update_attribute(:aprovado, true)        
    render :artistas     
  end

  def bloquear_artista
    @artist_data.update_attribute(:bloqueado, true)        
    render :artistas     
  end

  def desbloquear_artista
    @artist_data.update_attribute(:bloqueado, false)        
    render :artistas     
  end

  def noticias
     
     if params[:status]
        @status = params[:status]
     end

     @notices = Notice.all      
  end

  def nova_noticia
    @notice = Notice.new
    render :nova_noticia    
  end

  def edit_noticia
    
  end 

  def show_noticia    
  end 

  def remove_noticia
      @notice.destroy      
      render :noticias      
  end

  def success_noticia
    render :noticias
  end


  def palavras
      if params[:status]
        @status = params[:status]
     end
  end

  def nova_palavra
    @word = Word.new
    render :nova_palavra   
  end

  def edit_palavra    
  end 

  def show_palavra
  end 

  def remove_palavra
      @word.destroy
      render :palavras  
  end

  private

  def get_all_notices
     @notices = Notice.all 
  end

  def get_all_artist
    @artists = ArtistData.all 
  end

  def get_all_words
    @words = Word.all 
  end

  def get_dados_artista
    @artist_data = ArtistData.find(params[:id])
  end

  def get_notice_for_id
    @notice = Notice.find(params[:id])
  end

  def get_word_for_id
    @word = Word.find(params[:id])
  end

  def get_model_user
     @profile = params[:profile] 
  end

  def get_aguardando_aprovado
    @aguandado_aprovacao = ArtistData.where('aprovado = ?', 0)
  end
  
  def get_bloqueado
    @bloqueado = ArtistData.where('bloqueado = ?', 1)
  end

  def get_admin
    @adm = Artist.find_by('admin = ?', 1)
  end

end
