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

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])

    if @event.update(event_params)
      redirect_to root_url, notice: "Updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    redirect_to root_url, notice: "Event Successfully Deleted"
  end


  private

  def event_params
    params.require(:event).permit(:title, :date, :desc, :country, :city,:starting_time, :ending_time)
  end
end
