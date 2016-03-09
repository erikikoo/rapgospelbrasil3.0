class MemberesController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /memberes
  # GET /memberes.json
  def index
    @memberes = Member.all
  end

  # GET /memberes/1
  # GET /memberes/1.json
  def show
  end

  # GET /memberes/new
  def new
    @member = Member.new
  end

  # GET /memberes/1/edit
  def edit
  end

  # POST /memberes
  # POST /memberes.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberes/1
  # PATCH/PUT /memberes/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberes/1
  # DELETE /memberes/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to memberes_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:artist_data_id, :nome)
    end
end
