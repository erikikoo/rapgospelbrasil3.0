class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  #before_action :get_videos, only: [:index, :destroy]
  #before_action :get_artist_current
 
  # GET /videos
  # GET /videos.json
  def index   
    @profile = params[:profile] 
    if @profile == 'admin'   
      get_videos_adm
    else
      get_videos
    end    
  end

  # GET /videos/1
  # GET /videos/1.json
  def show

  end

  # GET /videos/new
  def new
    @profile = params[:profile] if params[:profile].present?   
    if current_artist.admin?
      @user = '/admin'
    else
      @user = '/adm'
    end
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
    render :new    
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @profile = params[:user]
    video = @video.link.split('/watch?v=')
    #video = Video.new(@video.link)
    
    if @profile == 'admin'
      @video.artist_id = current_artist.id
    else 
      @video.artist_data_id = current_artist.id
    end  
      respond_to do |format|
        if video[0].length == 23 and video[0] == 'https://www.youtube.com' and video.length <= 60
            if @video.save
              @status = 'success'
              @action = 'create'
              if @profile == 'admin' 
                @teste = '/admin' 
                get_videos_adm      
                format.js {render :show, location: @profile }
              else
                get_videos           
                @teste = '/adm'
                format.js {render :show, location: @profile }
              end            
            end          
        else 
          if @profile == 'admin'
            @user = "/"+@profile
          else
            @user = '/adm'
          end
          @status = 'danger'
          format.js { render :new, location: @status }          
        end

     end
  end

  
  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    @profile = params[:profile]
    if @profile == 'admin'
        @teste = "/"+@profile
    else
        @teste = '/adm'
    end
    respond_to do |format|
        if @profile == 'admin'
        get_videos_adm             
        @profile = 'admin'
        @status = 'success' 
        @action = 'destroy' 

          format.js { render :show}
        else
          @status = 'success'
          @profile = "adm"
          @action = 'destroy'
          get_videos
          format.js { render :show}
        end
    end
  end

  private
    

    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def get_videos
       @artist_data = ArtistData.find_by('artist_id = ?', current_artist.id) 
    end
   
    def get_videos_adm
      @videos = Video.where('artist_id = ? OR artist_id = ?', 1, 2) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:link, :profile)
    end




end


