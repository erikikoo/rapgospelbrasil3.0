class CommitmentsController < ApplicationController
  before_action :set_commitment, only: [:show, :edit, :update, :destroy]
  before_action :get_commitments , only: [:index, :update, :destroy, :create]
  before_action :get_profile, except: [:edit]
  before_action :get_artist_current
  # GET /commitments
  # GET /commitments.json
  def index    
  end

  # GET /commitments/1
  # GET /commitments/1.json
  def show
  end

  # GET /commitments/new
  def new
    @commitment = Commitment.new
  end

  # GET /commitments/1/edit
  def edit
      render :new
  end

  # POST /commitments
  # POST /commitments.json
  def create
    @commitment = Commitment.new(commitment_params)
    @commitment.artist_data_id = @artist_data.id
    respond_to do |format|
      if @commitment.save
        @status = 'success'
        @action = 'create'
        @profile = 'adm'
        format.js { render :index }        
      else        
        @status = 'danger'
        format.js {render :new }        
      end
    end
  end

  # PATCH/PUT /commitments/1
  # PATCH/PUT /commitments/1.json
  def update
    respond_to do |format|
      if @commitment.update(commitment_params)
        @status = 'success'
        @action = 'update'
        @profile = 'adm'
        format.js { render :index }        
      else
        format.js { render :new }        
      end
    end
  end

  # DELETE /commitments/1
  # DELETE /commitments/1.json
  def destroy
    @commitment.destroy
    @status = 'success'
    @profile = 'adm'
    @action = 'destroy'
    respond_to do |format|
      format.js { render :index}      
    end
  end

  private
    
  def get_artist_current
    @artist_data = ArtistData.find_by('artist_id = ?', current_artist.id)
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_commitment
      @commitment = Commitment.find(params[:id])
    end

    def get_commitments
      @commitments = Commitment.all
    end

    def get_profile 
      @profile = params[:profile]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commitment_params
      params.require(:commitment).permit(:artist_data_id, :local, :endereco, :numero, :telefone, :site, :data, :hora)
    end
end
