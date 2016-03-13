class SubmissionsController < ApplicationController

  def new
    @job = Job.find_by(params[:id])
    @laborer = current_laborer
    @submissions = Job.submissions.new(:job=>@job)
  end

  def show
   @findsubmission = Submission.find(params[:id]).laborer
  end

  def create

    laborer = current_laborer

    @job = Job.find(params[:job_id])
    @submit = @job.submissions.build(submit_params)
    @submit.laborer = laborer

    if @submit.save
      respond_to do |format|
        format.html { redirect_to @job, notice: 'Bid was successfully created.' }
      end
    else
      respond_to do |format|
        format.html { render @job }
      end
    end
  end

  private

  def submit_params
    params.require(:submission).permit(:price)
  end

end
