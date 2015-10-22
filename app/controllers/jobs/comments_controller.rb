class Jobs::CommentsController < CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Job.find(params[:job_id])
    end
end
