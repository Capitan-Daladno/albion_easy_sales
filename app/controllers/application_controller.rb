class ApplicationController < ActionController::Base

  require 'set'

  def index
    @users = User.all
    @events = Event.all
  end

  def user_each_name
    @users.each do |user|
      @user_each_name = user.name
    end
  end



end
