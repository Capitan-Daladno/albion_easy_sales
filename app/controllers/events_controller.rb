class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]
  skip_before_action :verify_authenticity_token, only: [:create]

  include ActiveModel::Dirty

  define_attribute_methods :status

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to root_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def add
    new_user = User.where(name: params[:addusertoevent])
    event.users << new_user
    redirect_to @event, notice: 'Event was successfully updated.'
  end

  def update
    if @event.update(event_params)
        @event.sold!(@event)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :datetime, :decription, :event_money, :status)
    end

end
