class Events::CommentsController < CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Events.find(params[:event_id])
    end
end
