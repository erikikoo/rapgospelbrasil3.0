class LikesController < ApplicationController
  
  before_action :set_artist_data, only: [:update, :create]
  after_action :set_artist_data, only: [:update]
  

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new()
    @like.artist_data_id = params[:id]
    @like.ip = request.remote_ip
    @like.like = true
@artist_data = ArtistData.includes(:link_sound_cloud, :like).find(params[:id])
    respond_to do |format|
      if @like.save 
        @gostei = true       
        format.js {render "artist_datas/like", location: @artist_data }
      else
        format.js { render :new }
        
      end
    end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    @artist_data = ArtistData.includes(:link_sound_cloud, :like).find(params[:id])
    @like = Like.find_by(artist_data_id: params[:id])    
    @status = params[:status] if params[:status].present?
    respond_to do |format|
      if @status.nil?
          @gostei = false
          @like.update_attributes({like: false, unlike: true})                  
          format.js {render "artist_datas/like"  }          
      else          
        @gostei = true
        @like.update_attributes({like: true, unlike: false})        
        format.js {render "artist_datas/like" }        
      end
    end
  end


  private
    

    def set_artist_data
      @artist_data = ArtistData.includes(:link_sound_cloud, :like).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:artist_data_id, :ip, :like, :unlike)
    end
end
