class EventsController < ApplicationController
  before_action :user_signed_in?, only: [:new, :create, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :desc, :country, :city,:starting_time, :ending_time)
  end
end
