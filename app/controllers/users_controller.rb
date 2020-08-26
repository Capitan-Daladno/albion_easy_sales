class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.name.downcase.titleize

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
      else
        format.html { redirect_to root_path, notice: 'Какая-то ошибка, такой пользователь, возможно, уже есть.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # Отдельно

  def giveout
    @user = User.find(params[:id])
    @user.giveout(@user)
    redirect_to root_path, notice: @user.name + ' получил деньги.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :money)
  end
end
