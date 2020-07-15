class UsersController < ApplicationController
  before_action only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    render :edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :money)
    end
end
