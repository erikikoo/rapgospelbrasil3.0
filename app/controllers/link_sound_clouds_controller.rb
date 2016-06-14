class LinkSoundCloudsController < ApplicationController
  before_action :set_link_sound_cloud, only: [:show, :edit, :update, :destroy]
  before_action :get_profile, only: [:index, :destroy, :update, :create]
  before_action :get_artist_current
  # GET /link_sound_clouds
  # GET /link_sound_clouds.json
  def index
    if params[:profile]
      @profile = params[:profile]
    end  
  end

  # GET /link_sound_clouds/1
  # GET /link_sound_clouds/1.json
  def show
  end

  # GET /link_sound_clouds/new
  def new
    @link_sound_cloud = LinkSoundCloud.new
  end

  # GET /link_sound_clouds/1/edit
  def edit
    render :new
  end

  # POST /link_sound_clouds
  # POST /link_sound_clouds.json
  def create
    @link_sound_cloud = LinkSoundCloud.new(link_sound_cloud_params)
    @link_sound_cloud.artist_data_id = current_artist.id
    @profile = 'adm'
    respond_to do |format|
      if @link_sound_cloud.save        
        @status = 'success'
        @action = 'create'
        get_artist_current
        format.js { render :index }
      else
        @status = 'danger'
        @action = 'create'
        format.js { render :new }  
      end
    end
  end

  # PATCH/PUT /link_sound_clouds/1
  # PATCH/PUT /link_sound_clouds/1.json
  def update
    respond_to do |format|
      if @link_sound_cloud.update(link_sound_cloud_params)
        @status = 'success'
        @action = 'update'
        format.js { render :index}        
      else
        @status = 'danger'
        @actions = 'update'
        format.js { render :new }        
      end
    end
  end

  # DELETE /link_sound_clouds/1
  # DELETE /link_sound_clouds/1.json
  def destroy
    @link_sound_cloud.destroy
    respond_to do |format|
      @status = 'success'
        @action = 'destroy'
      format.js { render :index }      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link_sound_cloud
      @link_sound_cloud = LinkSoundCloud.find(params[:id])
    end

    def get_artist_current
       @artist_data = ArtistData.find_by('artist_id = ?', current_artist.id)
    end  

    def get_profile
      if params[:profile]
        @profile = params[:profile]
      end  
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_sound_cloud_params
      params.require(:link_sound_cloud).permit(:artist_data_id, :link)
    end
end
