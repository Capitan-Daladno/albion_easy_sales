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
      redirect_to edit_event_path, notice: 'Добавьте участников'
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
    user_test_name = params[:addusertoevent]
    u1 = User.find_by name: user_test_name

    case @event.add_user_to_event(@event, u1, user_test_name)
    when "already_was" then redirect_to edit_event_url, notice: 'Пользователь уже был добавлен'
    when "success_added" then redirect_to edit_event_url, notice: 'Пользователь успешно добавлен'
    when "success_create_add" then redirect_to edit_event_url, notice: "Пользователь создан и добавлен"
    when "error_name" then redirect_to edit_event_url, notice: "Ошибка. Пользователь, либо существует, либо поле ввода пусто."
    when "undefined_error" then redirect_to edit_event_url, notice: "Такой пользователь уже существует"
    else redirect_to edit_event_url, notice: "что-то пошло не так"
    end

  end



  # Отдельно

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :datetime, :decription, :event_money, :status)
    end

end
