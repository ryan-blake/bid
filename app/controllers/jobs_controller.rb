class JobsController < ApplicationController
  include Pundit

  before_action :set_job, only: [:index, :show, :edit, :update, :destroy]
  before_filter :login_required, unless: :pundit_user

  # GET /jobs
  # GET /jobs.json
  def index

    ## @jobs = policy_scope(Job)
    ##laborer_longitude = request.location.longitude
    ##laborer_latitude = request.location.latitude //can't do on local server
    laborer_latitude = 34.029043

    laborer_longitude = -118.487545

    # @jobs = Job.near([laborer_latitude, laborer_longitude], 30)

    @jobs = Job.all

    @job = Job.find_by(params[:id])
    # fix nil:class??

    # @client = Client.find(params[:id])

    if Laborer.present?
      def show_bid_form
        render :partial=>"submit/form"
      end
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show

    @job = Job.find(params[:id])
    @laborer = @job.laborer_id
    @submission = Submission.new
    @submissions = @job.submissions
    # @prices = @price.all
    @client = @job.client


  end

  def update

    @job = Job.find(params[:id])
    if !params[:job]
      flash[:error] = "You didn't select a bid!"
      redirect_to [@job]
      return
    end
    @job.assign_attributes(job_params)

    if @job.save
      flash[:notice] = "Job was updated."
      # #37
      redirect_to [@job]
    else
      flash[:error] = "There was an error saving the job. Please try again."
      render :edit
    end
  end


  # GET /jobs/new
  def new
    @job = Job.new(params[:job_params])
    @client = pundit_user

  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])

    if current_laborer
      @laborer = current_laborer
    elsif current_client
      @client = current_client
    else
      redirect_to new_laborer_session_path, notice: 'You are not logged in.'
    end


  end

  def destroy
    # require current_client
    @job = Job.find(params[:id])
    @Job_time = @job.time

    @job.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end

  end


# POST /jobs
# POST /jobs.json
def create
  @job = Job.new(job_params)
  @job.client = current_client

  respond_to do |format|
    if @job.save
      format.html { redirect_to root_url, notice: 'Job was successfully created.' }
      format.json { render :show, status: :created, location: @job }
    else
      format.html { render :new }
      format.json { render json: @job.errors, status: :unprocessable_entity }
    end
  end


  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json



  # DELETE /jobs/1
  # DELETE /jobs/1.json

end

  private


  # Use callbacks to share common setup or constraints between actions.
  def set_job
    # @job = Job.find(params[:id])
  end


  def login_required
    redirect_to client_session_path, notice: 'Please login'
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_params
    params.require(:job).permit(:title, :name, :description, :laborer, :category_id, :price, :current_client, :selected_submission_id, :address1, :address2, :city, :state, :zipcode, :time)
  end
end
