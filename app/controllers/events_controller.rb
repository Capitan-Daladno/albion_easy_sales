class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    render :edit
  end

  def update

  end

  def add_money_to_user
    @event = Event.find(params[:id])
    @users = @event.users
    if @event.status = nil
      event.users.each do |user|
        @money_for_users.to_i + @user_money.to_i
      end
    else
      @user_money
    end
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end


  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :datetime, :decription, :event_money)
    end
end
