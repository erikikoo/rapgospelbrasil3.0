class NoticesController < ApplicationController
  layout 'welcome'

  before_action :set_notice, only: [:show, :edit, :update, :destroy]
  before_action :get_notices, only: [:create, :update, :destroy, :index]
  before_action :get_profile, only: [:index, :show, :destroy]
  
  require File.expand_path('lib/class/default_class.rb')
  require File.expand_path('lib/class/notice_class.rb')

  # GET /notices
  # GET /notices.json
  def index 
       
  end

  # GET /notices/1
  # GET /notices/1.json
  def show      
    
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
        @status = 'success'
        @action = 'create'
        format.js { render :create }        
      else
        @status = 'danger'
        format.js { render :new }        
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        @profile = 'admin'
        @status = 'success'
        @action = 'update'
        format.js { render :index}       
      else
        @status = 'danger'
        format.js { render :new }
        
      end
    end
  end
  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
     
    @notice.destroy
    respond_to do |format|
      @status = 'success'
      @action = 'destroy'
      format.js { render :index }      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice      
        notice = NoticeClass.new(params[:titulo])      
        @notice = Notice.find_by(titulo: notice.url_serialize)
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
