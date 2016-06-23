class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  before_action :get_words, only: [:create, :update, :index, :destroy]
  #before_action :get_profile , only: [:index, :update, :destroy, :show]
  # GET /words
  # GET /words.json
  def index  
    @words = Word.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  # GET /words/1
  # GET /words/1.json
  def show
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
    render :new
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)
    @word.artist_data_id = current_artist.id
    respond_to do |format|
      @profile = 'admin'
      if @word.save
        @status = 'success'
        @action = 'create'
        format.js { render :index }        
      else
        @status = 'danger'
        format.js { render :new }        
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      @profile = 'admin'
      if @word.update(word_params)
        @status = 'success'
        @action = 'update'
        format.js { render :index}        
      else
        @status = 'danger'
        format.js { render :new }        
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @profile = 'admin'
    @word.destroy
    @status = 'success'
    @action = 'destroy'
    respond_to do |format|
      format.js { render :index}      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    def get_words
      #@words = Post.paginate()
      @words = Word.order(created_at: :desc)
    end 

    def get_profile
      @profile = params[:profile]
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:artist_data_id, :titulo, :texto, :logo)
    end
end
