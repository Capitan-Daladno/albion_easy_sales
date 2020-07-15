class Event < ApplicationRecord

  SELL_STATUS = [
    ['Selling', 1],
    ['SOLD', 1],
    ['In queue', 1],
  ]
  @@SOLD_EVENTS = []
  has_and_belongs_to_many :users

  validates :title, presence: true, length: {maximum: 32}
  validates :datetime, presence: true

  def sold!(event)
      if event.status == true
        event.users.each do |user|
          user.money += (event.event_money / event.users.count).to_i
        user.save!
        end
        SOLD_EVENTS << event
      else
        nil
      end

  end

  def add_user_to_event(event)
    event.users << user.name(params[:addusertoevent])
  end
end
