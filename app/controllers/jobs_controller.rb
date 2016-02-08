class JobsController < ApplicationController

  before_action :set_job, only: [:index, :show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
      # @jobs = policy_scope(Job)
      @jobs = Job.all

  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
     @job = Job.find_by(params[:id])

  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])

  end

  # POST /jobs
  # POST /jobs.json
  def create

    @job.client = current_client
    @new_job = @job.build(job_params)


    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    @job = Job.find_by(params[:id])
    @laborer = current_laborer
    @job.assign_attributes(job_params)
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      # @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :laborer_id)
    end
end
