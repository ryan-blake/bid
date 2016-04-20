class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :create]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @client = Client.find(params[:id])
    @client.assign_attributes(client_params)
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client
      # @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through. update sanitizer for new.
    def client_params
      params.require(:client).permit(:name, :about, :email, :address1, :address2, :city, :state, :zipcode, :latitude, :longitude)
    end
end
