class PersController < ApplicationController
  before_action :set_per, only: [:show, :edit, :update, :destroy]

  # GET /pers
  # GET /pers.json
  def index
    @pers = Per.all
  end

  # GET /pers/1
  # GET /pers/1.json
  def show
  end

  # GET /pers/new
  def new
    @per = Per.new
  end

  # GET /pers/1/edit
  def edit
  end

  # POST /pers
  # POST /pers.json
  def create
    @per = Per.new(per_params)

    respond_to do |format|
      if @per.save
        format.html { redirect_to @per, notice: 'Per was successfully created.' }
        format.json { render :show, status: :created, location: @per }
      else
        format.html { render :new }
        format.json { render json: @per.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pers/1
  # PATCH/PUT /pers/1.json
  def update
    respond_to do |format|
      if @per.update(per_params)
        format.html { redirect_to @per, notice: 'Per was successfully updated.' }
        format.json { render :show, status: :ok, location: @per }
      else
        format.html { render :edit }
        format.json { render json: @per.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pers/1
  # DELETE /pers/1.json
  def destroy
    @per.destroy
    respond_to do |format|
      format.html { redirect_to pers_url, notice: 'Per was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_per
      @per = Per.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def per_params
      params.require(:per).permit(:person, :honest)
    end
end
