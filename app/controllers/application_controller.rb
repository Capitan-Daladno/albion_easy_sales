class ApplicationController < ActionController::Base

  def index
    @users = User.all
    @user = User.new
    @events = Event.all
  end

end
