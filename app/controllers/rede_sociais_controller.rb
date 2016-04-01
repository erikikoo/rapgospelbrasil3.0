class RedeSociaisController < ApplicationController
  before_action :set_rede_social, only: [:show, :edit, :update, :destroy]

  # GET /rede_sociais
  # GET /rede_sociais.json
  def index
    @rede_sociais = RedeSocial.all
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
  end

  # POST /rede_sociais
  # POST /rede_sociais.json
  def create
    @rede_social = RedeSocial.new(rede_social_params)
    @rede_social.artist_data_id = current_artist.id
    respond_to do |format|
      if @rede_social.save
        format.html { redirect_to "/show_rede_social/#{current_artist.id}/adm/success", notice: 'Rede social was successfully created.' }
        format.json { render :show, status: :created, location: @rede_social }
      else
        format.html { render :new }
        format.json { render json: @rede_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rede_sociais/1
  # PATCH/PUT /rede_sociais/1.json
  def update
    respond_to do |format|
      if @rede_social.update(rede_social_params)
        format.html { redirect_to "/show_rede_social/#{current_artist.id}/adm/atualizar", notice: 'Rede social was successfully updated.' }
        format.json { render :show, status: :ok, location: @rede_social }
      else
        format.html { render :edit }
        format.json { render json: @rede_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rede_sociais/1
  # DELETE /rede_sociais/1.json
  def destroy
    @rede_social.destroy
    respond_to do |format|
      format.html { redirect_to "/show_rede_social/#{current_artist.id}/adm/remover", notice: 'Rede social was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rede_social
      @rede_social = RedeSocial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rede_social_params
      params.require(:rede_social).permit(:artist_data_id, :facebook, :twitter, :instagram, :googleplus, :linkedid)
    end
end
