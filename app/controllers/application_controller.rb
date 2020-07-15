class ApplicationController < ActionController::Base

skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    @events = Event.all
  end

end
