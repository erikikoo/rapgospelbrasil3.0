class RedeSociaisController < ApplicationController
  before_action :set_rede_social, only: [:show, :edit, :update, :destroy]
  before_action :get_artist_current
  before_action :get_profile
  # GET /rede_sociais
  # GET /rede_sociais.json
  def index
    exist_redesocial_to_user
    
    #RedeSocial.where(artist_data_id: 5)
  end

  # GET /rede_sociais/1
  # GET /rede_sociais/1.json
  def show
  end

  # GET /rede_sociais/new
  def new
    @rede_social = RedeSocial.new
  end

  # GET /rede_sociais/1/edit
  def edit

    render :new
  end

  # POST /rede_sociais
  # POST /rede_sociais.json
  def create
    @rede_social = RedeSocial.new(rede_social_params)
    @profile = 'adm'
    @rede_social.artist_data_id = @artist_data.id
    
    respond_to do |format|
      if @rede_social.save
        exist_redesocial_to_user
        format.js {render :index}
      else
        format.html { render :new }        
      end
    end
  end

  # PATCH/PUT /rede_sociais/1
  # PATCH/PUT /rede_sociais/1.json
  def update
    respond_to do |format|
      @profile = 'adm'
      if @rede_social.update(rede_social_params)
        exist_redesocial_to_user
        format.js { render :index}        
      else
        format.js { render :edit }        
      end
    end
  end

  # DELETE /rede_sociais/1
  # DELETE /rede_sociais/1.json
  def destroy
    profile = 'adm'
    @rede_social.destroy
    exist_redesocial_to_user
    respond_to do |format|
      format.js { render :index }
    end
  end

  private
    def get_artist_current
      @artist_data = ArtistData.find_by(artist_id: current_artist.id)
    end

    def get_profile
      if params[:profile]
        @profile = params[:profile]
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_rede_social
      @rede_social = RedeSocial.find(params[:id])
    end

    def exist_redesocial_to_user
       @exist_rede_social_cad = RedeSocial.where(artist_data_id: current_artist.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rede_social_params
      params.require(:rede_social).permit(:artist_data_id, :facebook, :twitter, :instagram, :googleplus, :linkedid)
    end
end
