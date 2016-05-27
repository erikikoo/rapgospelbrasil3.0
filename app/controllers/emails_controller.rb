class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit,:update, :destroy] 
  before_action :get_artist_current

  # GET /emails
  # GET /emails.json
  def index
    @profile = 'art'    
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
    render :new
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(email_params)
    @email.artist_data_id = @artist_data.id
    respond_to do |format|
      if @email.save
        @profile = 'art'
        @status = 'success'
        format.js { render :index }        
      else
        @status = 'danger'
        format.js { render :new }        
      end
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        @profile = 'art'
        @status = 'success'
        format.js { render :index }        
      else
        @status = 'danger'
        format.js { render :new }        
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    @profile = 'art'
        @status = 'success'
    respond_to do |format|
      format.js { render :index}
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
