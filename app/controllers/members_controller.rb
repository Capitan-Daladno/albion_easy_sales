class MembersController < ApplicationController
  # Задаем родительский event для подписки
  before_action :set_event, only: [:create, :destroy]

  # Задаем подписку, которую юзер хочет удалить
  before_action :member, only: [:destroy]

  has_many :members, through: :members, source: :user


  def create
    # Болванка для новой подписки
    @new_member = @event.members.build(member_params)
    @new_member.user = user(user_params)

    @member = User.first.events.build(params[:event])
  end


  # DELETE /members/1
  def destroy
    @member.destroy
    redirect_to members_url, notice: 'Member was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = @event.members.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_params
      params.fetch(:member, {}).permit(:name)
    end
end
