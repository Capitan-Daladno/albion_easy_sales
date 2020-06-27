class UsersController < ApplicationController
  before_action only: [:show, :edit, :update]



  # GET /users/1
  def show
    @user = User.find(params[:id])
  end


  # GET /users/1/edit
  def edit
    render :edit
  end

  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name).fletch(:money)
    end
end
