class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password]
    )
  end

  def index
    @users = User.all
    @events = Event.all
    @users_sorted_by_money = User.all.sort_by {|h| h[:money]  * -1}
  end

end
