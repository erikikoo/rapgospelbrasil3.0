class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]
  before_action :get_artist_current
  # GET /phones
  # GET /phones.json
  def index
    @profile = params[:profile]
        
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
        @profile = 'adm'
        @status = 'success'
        @action = 'create'
        format.js { render :index }      
      else
        @status = 'danger'
        format.js { render :new }        
      end
    end
  end

  # PATCH/PUT /phones/1
  # PATCH/PUT /phones/1.json
  def update
    @profile = 'adm'
    respond_to do |format|
      if @phone.update(phone_params)
       @action = 'update'
        @status = 'success'
        format.js { render :index }        
      else
        @status = 'danger'
        format.js { render :edit }        
      end
    end
  end

  # DELETE /phones/1
  # DELETE /phones/1.json
  def destroy
    @profile = 'adm'
    @phone.destroy
    respond_to do |format|
      @status = 'success'
      @action = 'destroy'
      format.js { render :index }      
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
