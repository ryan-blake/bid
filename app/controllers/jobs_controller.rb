class JobsController < ApplicationController
  include Pundit

  before_action :set_job, only: [:index, :show, :edit, :update, :destroy]
  before_filter :login_required, unless: :pundit_user

  def index
    # @jobs = policy_scope(Job)
    @radius = pundit_user.zipcode
    @jobs = Job.all
    @c_user = pundit_user
    ##laborer_longitude = request.location.longitude
    ##laborer_latitude = request.location.latitude //can't do on local server
     # could set up for premium users to search for laborers
     #   @jobs = Job.near([pundit_user.latitude, pundit_user.longitude], @radius )
  end

  def show
    @job = Job.find(params[:id])
    @laborer = @job.laborer_id
    @submission = Submission.new
    @submissions = @job.submissions
    @client = @job.client
  end

  def update
    @job = Job.find(params[:id])
    if !params[:job]
      flash[:error] = "You didn't select a bid!"
      redirect_to [@job]
      return
    end


    if @job.update_attributes(job_params)
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
    @job.category = Category.new
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
    @job.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
    @Job_time = @job.time
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
  end

  def search
  @jobs = Job.where("category_id like ? and (title like ? or description like ?)",
            "%#{params[:category_id]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
  render :index
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
    params.require(:job).permit(:title, :name, :description, :laborer, :category_id, :price, :current_client, :selected_submission_id, :address1, :address2, :city, :state, :zipcode, :time, images_files: [], images_attributes: [ :id, :file, :_destroy], categories_attributes: [ :name ])
  end
end
