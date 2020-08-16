class ApplicationController < ActionController::Base

  def index
    @users = User.all
    @events = Event.all
    @users_sorted_by_money = User.all.sort_by {|h| h[:money]  * -1}
  end

end
