class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_any!

  def index
    @q = Job.ransack(params[:q])
    @job = @q.result(distinct: true)

    # if employer_signed_in?
    #   @q = current_employer.jobs.ransack(params[:q])
    #   @job = @q.result(distinct: true)
    # else
    #   @q = Job.ransack(params[:q])
    #   @job = @q.result(distinct: true)
    # end

  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.employer = current_employer
    @job.status = 'Created'

    if @job.save
      redirect_to jobs_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render action: :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :location, :start, :end,
                                :employer_id, :status)
  end

  def set_job
    # scope :salary_gt, ->(amount) { where('salary > ?', amount) }
    @job = Job.find(params[:id])
  end
end
