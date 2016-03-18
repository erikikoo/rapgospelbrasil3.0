class DiscographysController < ApplicationController
  before_action :set_discography, only: [:show, :edit, :update, :destroy]

  # GET /discographys
  # GET /discographys.json
  def index
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
  end

  # POST /discographys
  # POST /discographys.json
  def create
    @discography = Discography.new(discography_params)
    @discography.artist_data_id = current_artist.id

    respond_to do |format|
      
      if @discography.save
        format.html { redirect_to "/show_disco/#{current_artist.id}/adm", notice: 'Discography was successfully created.' }
        format.json { render :show, status: :created, location: @discography }
      else
        format.html { render :new }
        format.json { render json: @discography.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discographys/1
  # PATCH/PUT /discographys/1.json
  def update
    respond_to do |format|
      if @discography.update(discography_params)
        format.html { redirect_to "/show_disco/#{current_artist.id}/adm", notice: 'Discography was successfully updated.' }
        format.json { render :show, status: :ok, location: @discography }
      else
        format.html { render :edit }
        format.json { render json: @discography.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discographys/1
  # DELETE /discographys/1.json
  def destroy
    @discography.destroy
    respond_to do |format|
      format.html { redirect_to "/show_disco/#{current_artist.id}/adm", notice: 'Discography was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discography
      @discography = Discography.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discography_params
      params.require(:discography).permit(:artist_data_id, :nome, :data, :logo)
    end
end
