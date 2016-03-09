class EddressShowsController < ApplicationController
  before_action :set_eddress_show, only: [:show, :edit, :update, :destroy]

  # GET /eddress_shows
  # GET /eddress_shows.json
  def index
    @eddress_shows = EddressShow.all
  end

  # GET /eddress_shows/1
  # GET /eddress_shows/1.json
  def show
  end

  # GET /eddress_shows/new
  def new
    @eddress_show = EddressShow.new
  end

  # GET /eddress_shows/1/edit
  def edit
  end

  # POST /eddress_shows
  # POST /eddress_shows.json
  def create
    @eddress_show = EddressShow.new(eddress_show_params)

    respond_to do |format|
      if @eddress_show.save
        format.html { redirect_to @eddress_show, notice: 'Eddress show was successfully created.' }
        format.json { render :show, status: :created, location: @eddress_show }
      else
        format.html { render :new }
        format.json { render json: @eddress_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eddress_shows/1
  # PATCH/PUT /eddress_shows/1.json
  def update
    respond_to do |format|
      if @eddress_show.update(eddress_show_params)
        format.html { redirect_to @eddress_show, notice: 'Eddress show was successfully updated.' }
        format.json { render :show, status: :ok, location: @eddress_show }
      else
        format.html { render :edit }
        format.json { render json: @eddress_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eddress_shows/1
  # DELETE /eddress_shows/1.json
  def destroy
    @eddress_show.destroy
    respond_to do |format|
      format.html { redirect_to eddress_shows_url, notice: 'Eddress show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eddress_show
      @eddress_show = EddressShow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eddress_show_params
      params.require(:eddress_show).permit(:commitment_id, :local, :endereco, :numero, :telefone, :site)
    end
end
