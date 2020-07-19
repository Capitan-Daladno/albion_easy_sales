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
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to root_path, notice: 'User was successfully created.' }
          format.js
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  # Здесь добавлен вызов метода sold!
  def update
    if @event.update(event_params)
        @event.sold!(@event)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # Отдельно

  def add
    new_user = User.where(name: params[:addusertoevent])
    event.users << new_user
    redirect_to @event, notice: 'Event was successfully updated.'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :datetime, :decription, :event_money, :status)
    end

end
