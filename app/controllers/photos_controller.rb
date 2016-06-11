class PhotosController < ApplicationController
  before_action :set_job

  def index
    @photos = @job.photos
  end

  def create
    photo = @job.photos.create(photo_params)
    render partial: "photo", locals: {photo: photo, idx: @job.photos.count}
  end

  def update
    @job.update(job_params)
    redirect_to root_path
  end

  private

  def set_job
    @job = Job.first_or_create!
  end

  def job_params
    params.require(:job).permit!
  end

  def photo_params
    params.require(:photo).permit!
  end
end
