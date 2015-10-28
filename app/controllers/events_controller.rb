class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).includes(:user)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.status = 'Created'

    if @event.save
      redirect_to events_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render action: :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def approve
    Event.where(id: params[:event_ids]).update_all( status: 'Approved' )
    redirect_to events_url
  end

  private
  def event_params
    params.require(:event).permit(:title, :location, :start_time, :end_time,
                                :user_id, :status)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
