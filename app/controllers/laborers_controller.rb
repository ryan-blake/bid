class LaborersController < ApplicationController
  before_action :set_laborer, only: [:show, :edit, :update, :destroy, :index, :create]

  # GET /laborers
  # GET /laborers.json
  def index
    @laborers = Laborer.all
  end

  def show
    @laborer = Laborer.find(params[:id])
  end

  def new
    @laborer = Laborer.new
  end

  def edit
    @laborer = Laborer.find(params[:id])
  end

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

  def update
    @laborer = Laborer.find(params[:id])
    @laborer.assign_attributes(laborer_params)
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
      @laborer = Laborer.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laborer_params
      params.require(:laborer).permit(:name, :about, :email, :address1, :address2, :city, :state, :zipcode, :latitude, :longitude)
    end
end
