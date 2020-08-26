class EventsController < ApplicationController
  before_action :authenticate_seller!, except: %i[show index]
  before_action :set_event, only: %i[show edit update]

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to edit_event_path(@event)
    else
      render :new
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

  def add_user_to_event
    @event = Event.find(params[:id])
    user_name_to_event = params[:addusertoevent]

    case @event.add_user_to_event(@event, user_name_to_event)
    when 'already_was' then redirect_to edit_event_url, notice: 'Пользователь уже был добавлен'
    when 'success_added' then redirect_to edit_event_url, notice: 'Пользователь успешно добавлен'
    when 'success_create_add' then redirect_to edit_event_url, notice: 'Пользователь создан и добавлен'
    when 'empty_field' then redirect_to edit_event_url, notice: 'Поле ввода пусто. Введите имя пользователя'
    when 'error_name' then redirect_to edit_event_url, notice: 'Ошибка имени.'
    else redirect_to edit_event_url, notice: 'что-то пошло не так'
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
