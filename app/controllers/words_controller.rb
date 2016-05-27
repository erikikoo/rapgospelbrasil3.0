class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  before_action :get_words, only: [:create, :update, :index]
  # GET /words
  # GET /words.json
  def index
    
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
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)
    @word.artist_data_id = current_artist.id
    respond_to do |format|
      if @word.save
        @profile = 'admin'
        format.js { render :index }        
      else
        format.html { render :new }        
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to '/palavras/admin/atualizar'}
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to '/palavras/admin/remover'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    def get_words
      @words = Word.order(created_at: :desc)
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:artist_data_id, :titulo, :texto, :logo)
    end
end
