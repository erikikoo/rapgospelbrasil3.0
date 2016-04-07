class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]
  before_action :get_artist_current
  # GET /phones
  # GET /phones.json
  def index
    @phones = Phone.all
    
  end

  # GET /phones/1
  # GET /phones/1.json
  def show
    @phones = Email.find(params[:id])
  end

  # GET /phones/new
  def new
    @phone = Phone.new
  end

  # GET /phones/1/edit
  def edit
  end

  # POST /phones
  # POST /phones.json
  def create
    @phone = Phone.new(phone_params)
    @phone.artist_data_id = @artist_data.id
    respond_to do |format|
      if @phone.save
        format.html { redirect_to "/show_telefone/#{@artist_data.id}/adm", notice: 'Phone was successfully created.' }
        format.json { render :show, status: :created, location: @phone }
      else
        format.js { render :new }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1
  # PATCH/PUT /phones/1.json
  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to "/show_telefone/#{@artist_data.id}/adm", notice: 'Phone was successfully updated.' }
        format.json { render :show, status: :ok, location: @phone }
      else
        format.js { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1
  # DELETE /phones/1.json
  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to "/show_telefone/#{@artist_data.id}/adm", notice: 'Phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
     def get_artist_current
      @artist_data = ArtistData.find_by('artist_id = ?', current_artist.id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Phone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_params
      params.require(:phone).permit(:artist_data_id, :telefone)
    end
end
