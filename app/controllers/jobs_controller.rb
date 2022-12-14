class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  
  def create
    @job = Job.new(job_params)
    @job.save
    redirect_to job_path(@job)
  end
  
  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, status: :see_other
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :start_time, :end_time, :status_type, :user_id)
  end
end
