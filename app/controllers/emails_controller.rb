class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit,:update, :destroy] 
  before_action :get_artist_current

  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(email_params)
    @email.artist_data_id = @artist_data.id
    respond_to do |format|
      if @email.save
        format.html { redirect_to "/show_email/#{@artist_data.id}/adm", notice: 'Email was successfully created.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.js { render :new }
        #format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to "/show_email/#{@artist_data.id}/adm" }
        format.json { render :show, status: :ok, location: @email }
      else
        format.js { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy

    respond_to do |format|
      format.html { redirect_to "/show_agenda/#{current_artist.id}/adm"}
    end
  end

  private
    def get_artist_current
      @artist_data = ArtistData.find_by('artist_id = ?', current_artist.id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:artist_data_id, :email)
    end
end
