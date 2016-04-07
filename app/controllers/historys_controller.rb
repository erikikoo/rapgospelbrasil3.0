class HistorysController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  # GET /historys
  # GET /historys.json
  def index
    @historys = History.all
  end

  # GET /historys/1
  # GET /historys/1.json
  def show
  end

  # GET /historys/new
  def new
    @history = History.new
  end

  # GET /historys/1/edit
  def edit
  end

  # POST /historys
  # POST /historys.json
  def create
    @history = History.new(history_params)

    respond_to do |format|
      if @history.save
        format.html { render '/principal/perfil'}
        format.json { render :show, status: :created, location: @history }
      else
        format.html { render :new }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historys/1
  # PATCH/PUT /historys/1.json
  def update
    respond_to do |format|
      if @history.update(history_params)
        @artist_data = ArtistData.find_by('artist_id = ?', current_artist.id)
        format.js
        format.json { render :show, status: :ok, location: @history }
      else
        format.js { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historys/1
  # DELETE /historys/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to historys_url, notice: 'History was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = History.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_params
      params.require(:history).permit(:artist_data_id, :historia)
    end
end
