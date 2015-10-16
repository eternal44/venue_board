class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_employer!

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.employer = current_employer

    if @job.save
      redirect_to request.referrer
    else
      render action: :new
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :location, :start, :end,
                                :employer_id, :status)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
end
