class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]
  before_action :get_notices, only: [:create, :update, :destroy, :index]
  before_action :get_profile, only: [:index, :show, :destroy]
  # GET /notices
  # GET /notices.json
  def index 
       
  end

  # GET /notices/1
  # GET /notices/1.json
  def show        
    respond_to do |format|
      format.js
    end
  end

  # GET /notices/new
  def new
    @notice = Notice.new
  end

  # GET /notices/1/edit
  def edit
    render :new
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(notice_params)
    @notice.artist_data_id = current_artist.id
    @profile = "admin"
    respond_to do |format|
      if @notice.save
        format.js { render :create }        
      else
        format.js { render :new }        
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.js { render :index}       
        @profile = 'admin'
      else
        format.html { render :edit }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
     
    @notice.destroy
    respond_to do |format|
      format.js { render :index }      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    def get_notices
      @notices = Notice.order(created_at: :desc)  
    end

    def get_profile
      @profile = params[:profile]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_params
      params.require(:notice).permit(:artist_data_id, :noticia, :titulo, :logo)
    end
end
