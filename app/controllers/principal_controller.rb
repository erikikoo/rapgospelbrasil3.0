class PrincipalController < ApplicationController
  before_action :set_artistas, only: [:artista, :agenda, :contato, :disco, :email, :telefone, :video, :rede_social]
  before_action :authenticate_artist!, only: [:artista, :index]
  before_action :set_discos, only: [:edit_disco, :remove_disco]
  before_action :set_agendas, only: [:edit_agenda, :remove_agenda]
  before_action :set_emails, only: [:edit_email, :remove_email]
  before_action :set_phones, only: [:edit_telefone, :remove_telefone]
  before_action :set_videos, only: [:remove_video]
  before_action :set_rede_sociais, only: [:edit_rede_social, :remove_rede_social]
  
  before_action :get_model_user
  
  
  def index
  end

  def artista
  end
###########################################################33  
  def agenda     
  end
  def novo_agenda
     
     @commitment = Commitment.new
          
  end
  def edit_agenda

  end
  def remove_agenda      
      @commitment.destroy
      @artist_data = ArtistData.find(current_artist.id)
      flash[:notice] = "Removido"
      render :agenda
  end
###########################################################33
  def telefone
  end
  def novo_telefone
    @phone = Phone.new 
  end
  def edit_telefone    
  end

  def remove_telefone  
      @phone.destroy
      @artist_data = ArtistData.find(current_artist.id)
      render :telefone
  end
###########################################################33
  def email
  end

  def novo_email
    @email = Email.new 
  end
  def edit_email    
  end
  def remove_email      
      @email.destroy
      @artist_data = ArtistData.find(current_artist.id)
      render :email
  end
  ###########################################################33
            #DISCO#
  def disco   
  end
  def novo_disco
    @discography = Discography.new 
  end
  def edit_disco    
  end
  def remove_disco      
      @discography.destroy
      @artist_data = ArtistData.find(current_artist.id)
      render :disco
  end
###########################################################33
  def video   
  end

  def novo_video
    @video = Video.new 
  end  
  def remove_video
      @video.destroy
      @artist_data = ArtistData.find(current_artist.id)
      render :video
  end
###########################################################33
  def rede_social   
  end
  
  def novo_rede_social
    @rede_social = RedeSocial.new 
  end
  def edit_rede_social    
  end
  
  def remove_rede_social      
      @rede_social.destroy
      @artist_data = ArtistData.find(current_artist.id)
      render :rede_social
  end
###########################################################33
  private

  def get_model_user
     @profile = params[:profile] 
  end

  def set_emails 
    @email = Email.find(params[:id])
  end

  def set_videos 
    @video = Video.find(params[:id])
  end

  def set_rede_sociais 
    @rede_social = RedeSocial.find(params[:id])
  end

  def set_phones 
    @phone = Phone.find(params[:id])
  end

  def set_agendas 
    @commitment = Commitment.find(params[:id])
  end

  def set_discos
    @discography = Discography.find(params[:id])
  end 

  def set_artistas
  	@artist_data = ArtistData.find(params[:id])
  end	
end
