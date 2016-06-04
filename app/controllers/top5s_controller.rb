class Top5sController < ApplicationController
  before_action :set_top5, only: [:show, :edit, :update, :destroy]
  before_action :get_top5s, only: [:index, :create, :destroy, :update]
  # GET /top5s
  # GET /top5s.json
  def index
       
  end

  # GET /top5s/1
  # GET /top5s/1.json
  def show
  end

  # GET /top5s/new
  def new
    @top5 = Top5.new
  end

  # GET /top5s/1/edit
  def edit
     render :new
  end
  # POST /top5s
  # POST /top5s.json
  def create
    @top5 = Top5.new(top5_params)
    
    respond_to do |format|
      if @top5.save
        format.js { render :index} 
      else
        format.js { render :new }        
      end
    end
  end

  # PATCH/PUT /top5s/1
  # PATCH/PUT /top5s/1.json
  def update
    respond_to do |format|
      if @top5.update(top5_params)
        format.js { render :index } 
        
      else
        format.js { render :edit }
        
      end
    end
  end

  # DELETE /top5s/1
  # DELETE /top5s/1.json
  def destroy
    @top5.destroy
    respond_to do |format|
      format.js { render :index }      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top5
      @top5 = Top5.find(params[:id])
    end

    def get_top5s
      @top5s = Top5.order(created_at: :desc) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def top5_params
      params.require(:top5).permit(:artist_id, :titulo, :artista, :titulo2, :artista2,:titulo3, :artista3,:titulo4, :artista4,:titulo5, :artista5)
    end
end
