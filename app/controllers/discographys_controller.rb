class DiscographysController < ApplicationController
  before_action :set_discography, only: [:show, :edit, :update, :destroy]

  



  before_action :get_artist_current
  # GET /discographys
  # GET /discographys.json
  def index
    @profile = params[:profile]
    @discographys = Discography.all    
  end

  # GET /discographys/1
  # GET /discographys/1.json
  def show
    
  end

  # GET /discographys/new
  def new
    @discography = Discography.new
    
  end

  # GET /discographys/1/edit
  def edit
    render :new
  end

  # POST /discographys
  # POST /discographys.json
  def create    
    @discography = Discography.new(discography_params) 
    @discography.artist_data_id = @artist_data.id   
    @artist_data = ArtistData.find(@discography.artist_data_id)
    @profile = "adm"    
    if @discography.save       
      respond_to do |format|
        @status = 'success' 
        @action = 'create'      
        format.js {render :index }
      end
    else 
      @status = 'danger'
      render :new
    end
    
   
  end

  # PATCH/PUT /discographys/1
  # PATCH/PUT /discographys/1.json
  def update
    respond_to do |format|
      @profile = "adm"
      if @discography.update(discography_params)
        @status = 'success'
        @action = 'update'
        format.js { render :index}        
      else
        format.js { render :new }
        
      end
    end
  end

  # DELETE /discographys/1
  # DELETE /discographys/1.json
  def destroy
    @discography.destroy
    @profile = "adm"
    respond_to do |format|
      @status = 'success'
      @action = 'destroy'
      format.js { render :index }      
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discography
      @discography = Discography.find(params[:id])
    end

    def get_artist_current
      @artist_data = ArtistData.find_by('artist_id = ?', current_artist.id)
    end

    

    # Never trust parameters from the scary internet, only allow the white list through.
    def discography_params
      params.require(:discography).permit(:nome, :data, :logo, :artist_data_id)
    end
end
