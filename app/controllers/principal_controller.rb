class PrincipalController < ApplicationController
  before_action :set_artistas, only: [:agenda, :contato, :disco, :email, :telefone, :video,  :historia]
  before_action :set_discos, only: [:edit_disco, :remove_disco]
  before_action :set_agendas, only: [:edit_agenda, :remove_agenda]
  before_action :set_emails, only: [:edit_email, :remove_email]
  before_action :set_phones, only: [:edit_telefone, :remove_telefone]
  before_action :set_videos, only: [:remove_video]
  before_action :set_rede_sociais, only: [:edit_rede_social, :remove_rede_social]
  before_action  :get_artist_current, only: [:remove_rede_social,:remove_agenda,:remove_telefone, :remove_email, :remove_disco, :remove_video]

  before_action :authenticate_artist!
  before_action :get_model_user
  
  def index
    @artist_data = ArtistData.find_by(artist_id: current_artist.id)    
    if @artist_data.nil?
      @artist_data = ArtistData.new       
      #@artist_data.artist_id = current_artist.id
      @artist_data.update_attribute(:artist_id, current_artist.id)     
    end

  end

  def artista
   @artist_data = ArtistData.find_by(artist_id: current_artist.id)  
    
    if @artist_data.nil?
        @artist_data = ArtistData.new
       
        
        @artist_data.phones.build
        @artist_data.emails.build
        @artist_data.build_history
        render 'artist_datas/novo_artista'
    else 
        @artist_data = ArtistData.new        
        render :artista
    end
  end

  def perfil
    @artist_data = ArtistData.find_by(artist_id: current_artist.id) 
    @videos = Video.where(artist_data_id: current_artist.id)
    @classe = 'container-perfil'

    if @artist_data.nome.nil?
      @artist_data = ArtistData.new

        @artist_data.phones.build
        @artist_data.emails.build
        @artist_data.build_history
      render 'artist_datas/novo_artista'
    else
      render :perfil
    end
    
  end
###########################################################33  
  def agenda    
    if params[:status]
          @status = params[:status]
    end     
  end
  def novo_agenda     
     @commitment = Commitment.new          
  end
  def edit_agenda

  end
  def remove_agenda      
      @commitment.destroy          
      render :agenda, location: @artist_data 
  end
###########################################################33
  def historia  
    if params[:status]
        @status = params[:status]
     end     
  end
  def novo_historia
     @history = Commitment.new          
  end
  def edit_historia

  end
  def remove_historia      
      @history.destroy      
      render :agenda
  end
###########################################################33
  def telefone
    if params[:status]
        @status = params[:status]
     end  
  end
  def novo_telefone
    @phone = Phone.new 
  end
  def edit_telefone    
  end

  def remove_telefone  
      @phone.destroy      
      render :telefone, location: @artist_data 
  end
###########################################################33
  # def email
  #   if params[:status]
  #       @status = params[:status]
  #    end  
  # end

  # def novo_email
  #   @email = Email.new         
  # end
  
  # def edit_email    
  # end
  # def remove_email      
  #     @email.destroy      
  #     render :email, location: @artist_data 
  # end
  ###########################################################33
            #DISCO#
  def disco  
    if params[:status]
        @status = params[:status]
    end       
  end
  def novo_disco
    @discography = Discography.new
    @discography.artist_data_id = current_artist.id
  end
  def edit_disco    
  end
  def remove_disco      
      @discography.destroy
      
      render :disco
  end
###########################################################33
  def video  
    

    if params[:status]
        @status = params[:status]
    end 
   @videos = Video.where(artist_data_id: current_artist.id)
  end

  def novo_video
    @video = Video.new 
    @user = "/artista"
  end  
  def remove_video
      @admin = params[:profile]
      @video.destroy 
      if @admin == 'admin'
        @videos = Video.where("artist_id = ? OR artist_id = ?" ,1,2) 
      else
        @admin = 'adm'
        @videos = Video.where(artist_data_id: current_artist.id)
      end

      render :video, location: @admin
  end
###########################################################33
  def rede_social     
    @rede_social = RedeSocial.find_by(artist_data_id: current_artist.id)
    @teste = current_artist.id
    if params[:status]
        @status = params[:status]
    end 

    if @rede_social.nil? 
      @rede_social = RedeSocial.new            
      render :rede_social, location: @rede_social      
    else
      render :edit_rede_social, location: @rede_social
    end
  end
  
  def novo_rede_social
    @rede_social = RedeSocial.new 
  end
  def edit_rede_social    
  end
  
  def remove_rede_social      
      @rede_social.destroy     
      render :rede_social
  end
###########################################################33
  private

  def get_artist_current
     @artist_data = ArtistData.find_by(artist_id: current_artist.id)
  end

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
  	@artist_data = ArtistData.find_by(artist_id: current_artist.id)
  end	

end
