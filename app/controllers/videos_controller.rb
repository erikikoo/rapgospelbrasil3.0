class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :get_videos, only: [:index, :destroy]
  before_action :get_artist_current
 
  # GET /videos
  # GET /videos.json
  def index   
    @profile = params[:profile]    
  end

  # GET /videos/1
  # GET /videos/1.json
  def show

  end

  # GET /videos/new
  def new
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
    if @profile == 'admin'
      @video.artist_id = current_artist.id
    else 
      @video.artist_data_id = @artist_data.id
    end  
      respond_to do |format|
        if @video.link.length <= 60
          if @video.save        
            @status = 'success'
            if @profile == 'admin' 
              @videos = Video.where('artist_id = ? OR artist_id = ?', 1, 2)            
              format.js {render :show_adm, location: @profile }
            else
              @videos = Video.where(artist_data_id: current_artist.id)            
              @profile = 'adm'
              format.js {render :show_art, location: @profile }
            end
          else
            @status = 'error'
            format.js { render :new }
            
          end
        else
            @status = 'error'
            format.js { render :new }
        end
     end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
        @admin = params[:user]

      if @video.update(video_params)
        @status = 'success'
        format.js { render :index}        
      else
        @status = 'danger'
        format.js { render :new }        
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    @admin = params[:user]
    respond_to do |format|
        if @admin == 'admin'
        @status = 'success'   
          format.js {render :show_adm }
        else
          @status = 'success'
          @profile = "adm"
          format.js { render :show_art}
        end
    end
  end

  private
     def get_artist_current
      @artist_data = ArtistData.find_by('artist_id = ?', current_artist.id)
      end

    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def get_videos
      @videos = Video.where(artist_data_id: current_artist.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:link, :profile)
    end




end


