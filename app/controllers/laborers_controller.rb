class LaborersController < ApplicationController
  before_action :set_laborer, only: [:show, :edit, :update, :destroy]

  # GET /laborers
  # GET /laborers.json
  def index
    @laborers = Laborer.all
  end

  # GET /laborers/1
  # GET /laborers/1.json
  def show
    if params[:id]
        @laborer = Laborer.find(params[:id])
      end
         @jobs = @laborer.jobs.all
  end

  # GET /laborers/new
  def new
    @laborer = Laborer.new
  end

  # GET /laborers/1/edit
  def edit
  end

  # POST /laborers
  # POST /laborers.json
  def create
    @laborer = Laborer.new(laborer_params)

    respond_to do |format|
      if @laborer.save
        format.html { redirect_to @laborer, notice: 'Laborer was successfully created.' }
        format.json { render :show, status: :created, location: @laborer }
      else
        format.html { render :new }
        format.json { render json: @laborer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laborers/1
  # PATCH/PUT /laborers/1.json
  def update
    respond_to do |format|
      if @laborer.update(laborer_params)
        format.html { redirect_to @laborer, notice: 'Laborer was successfully updated.' }
        format.json { render :show, status: :ok, location: @laborer }
      else
        format.html { render :edit }
        format.json { render json: @laborer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laborers/1
  # DELETE /laborers/1.json
  def destroy
    @laborer.destroy
    respond_to do |format|
      format.html { redirect_to laborers_url, notice: 'Laborer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laborer
      @laborer = Laborer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laborer_params
      params[:laborer]
    end
end
