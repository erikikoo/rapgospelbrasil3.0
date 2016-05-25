class CommitmentsController < ApplicationController
  before_action :set_commitment, only: [:show, :edit, :update, :destroy]

  before_action :get_artist_current
  # GET /commitments
  # GET /commitments.json
  def index
    @commitments = Commitment.all
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
  end

  # POST /commitments
  # POST /commitments.json
  def create
    @commitment = Commitment.new(commitment_params)
    @commitment.artist_data_id = @artist_data.id
    respond_to do |format|
      if @commitment.save
        format.html { redirect_to "/show_agenda/#{current_artist.id}/adm"}
        format.json { render :show, status: :created, location: @commitment }        
      else
        #flash[:notice] = 'Ocorreu um erro'
        format.html { render :new }
        
        format.js {render :new }
        format.json { render json: @commitment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commitments/1
  # PATCH/PUT /commitments/1.json
  def update
    respond_to do |format|
      if @commitment.update(commitment_params)
        format.html { redirect_to "/show_agenda/#{@artist_data.id}/adm"}
        format.json { render :show, status: :ok, location: @commitment }
      else
        format.js { render :edit }
        format.json { render json: @commitment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commitments/1
  # DELETE /commitments/1.json
  def destroy
    @commitment.destroy
    
    respond_to do |format|
      format.html { redirect_to "/show_agenda/#{current_artist.id}/adm"}
      format.json { head :no_content }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def commitment_params
      params.require(:commitment).permit(:artist_data_id, :local, :endereco, :numero, :telefone, :site, :data, :hora)
    end
end
