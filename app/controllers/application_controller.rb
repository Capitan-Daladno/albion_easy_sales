class ApplicationController < ActionController::Base

  def index
    @users = User.all
    @events = Event.all
  end

end
