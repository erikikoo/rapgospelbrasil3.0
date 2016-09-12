class ArtistDatasController < ApplicationController
  layout 'welcome'
  before_action :set_artist_data, only: [:show,:edit, :update, :destroy,  :discography, :contact, :history, :agenda, :rede_social]
  before_action :like_query, only: [:search_artista  ,:index, :show]
  
  # GET /artist_datas
  # GET /artist_datas.json
  def index
     #ransack
     @q = ArtistData.where(aprovado: true, bloqueado: false).ransack(params[:q])
     @artist_data = @q.result
  end

  # GET /artist_datas/1
  # GET /artist_datas/1.json
  def show
    ip = request.remote_ip
    @artist_data = ArtistData.includes(:link_sound_cloud, :likes).find(params[:id])    
    @counter_likes = Like.where(artist_data_id: params[:id], curtido: true).group(:artist_data_id).count
    

  end
  

  # GET /artist_datas/new
  def new
    @artist_data = ArtistData.new
    
    @artist_data.phones.build
    @artist_data.emails.build
    @artist_data.build_history
  end

  # GET /artist_datas/1/edit
  def edit
  end

  # POST /artist_datas
  # POST /artist_datas.json
  def create
    @artist_data = ArtistData.find_by('artist_id = ?', current_artist.id)  
    

    if @artist_data.nil?
      @artist_data = ArtistData.new(artist_data_params)
      @artist_data.artist_id = current_artist.id

      @artist_data.save       
      respond_to do |format|       
        format.js {render :create }
      end
    else
      respond_to do |format|      
        @current_id = params[:id]
        @artist_data.update(artist_data_params)      
        format.js {render :create }
      end
    end
  end

  # PATCH/PUT /artist_datas/1
  # PATCH/PUT /artist_datas/1.json
  def update
    @artist_data = ArtistData.find_by(artist_id: current_artist.id)
    respond_to do |format|
      #if @artist_data.id == current_artist.id
      #@current_id = params[:id]
      @artist_data.update(artist_data_params)      
      format.js {render 'principal/perfil' }
    end
      #end
    #end
  end

  # DELETE /artist_datas/1
  # DELETE /artist_datas/1.json
  def destroy
    
      @artist_data.destroy
      respond_to do |format|
        @artist_data.avatar = nil
        format.html { redirect_to "/artistas/adm", notice: 'Artist data was successfully destroyed.' }
        format.json { head :no_content }
      end

  end

  def discography
    @discography = Discography.new 
    @profile = params[:profile]   
  end

  def contact
  end 

  def history
  end 

  def videos
    @videos = Video.where('artist_data_id = ?', params[:id] )
  end

  def rede_social
  end

  def agenda
     @profile = params[:profile]   
  end  

  def search_artista      

     @q = ArtistData.where(aprovado: true, bloqueado: false).ransack(params[:q])
     @artist_data = @q.result
    
    respond_to do |format|  
      format.js
    end
  end


  private
    
    def like_query
      ip = request.remote_ip

      @artist_data = ArtistData.includes(:likes).where(aprovado: true, bloqueado: false)
      @count_per_ip = Like.where(ip: ip).group(:artist_data_id).count     
      @exist_likes = Like.select('curtido, unlike, artist_data_id, ip').where(ip: ip)
    end

    def set_artist_data
      @artist_data = ArtistData.find(params[:id])   
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_data_params
      params.require(:artist_data).permit(:nome, :historia, :logo ,:emails_attributes => [:email], :phones_attributes => [:telefone], :history_attributes => [:historia])
    end
end
