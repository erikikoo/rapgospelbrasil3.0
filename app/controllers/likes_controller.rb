class LikesController < ApplicationController
  
  before_action :set_artist_data, only: [:create]
  #after_action  :counter_likes, only: [:update]
  

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new()
    @like.artist_data_id = params[:id]
    @like.ip = request.remote_ip
    @like.curtido = true
    @artist_data = ArtistData.includes(:link_sound_cloud, :likes).find(params[:id])    
    @target = params[:target]
    respond_to do |format|
      if @like.save 
        @gostei = true         
        @counter_like = Like.where(artist_data_id: params[:id], curtido: true).count
        @exist_likes = Like.select('curtido, unlike, artist_data_id')
        format.js {render "artist_datas/like" }        
      else
        format.js { render :new }        
      end
    end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    
    @like = Like.find_by(artist_data_id: params[:id]) 
    @artist_data = ArtistData.includes(:link_sound_cloud, :likes).find(params[:id])    
    @status = params[:status] if params[:status].present?
    @target = params[:target] 

    #@counter_like = Like.where(artist_data_id: params[:id], curtido: true).count                      
    respond_to do |format|
      if @status.nil?
          @gostei = false
          @like.update_attributes({curtido: false, unlike: true})                  
          #if @target == 'show'
          #end
          @counter_like = Like.where(artist_data_id: params[:id], curtido: true).count
            format.js {render "artist_datas/like"  }          
      else          
        @gostei = true
        @like.update_attributes({curtido: true, unlike: false})        
        @counter_like = Like.where(artist_data_id: params[:id], curtido: true).count
        format.js {render "artist_datas/like" }        
      end
    end
  end


  private
    

    def set_artist_data
     @artist_data = ArtistData.includes(:likes).where(aprovado: true, bloqueado: false)
     @teste = Like.group(:artist_data_id).count
     @exist_likes = Like.select('curtido, unlike, artist_data_id')
    end

    def counter_likes
      @counter_like = Like.where(artist_data_id: params[:id], curtido: true).count
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:artist_data_id, :ip, :like, :unlike)
    end
end
