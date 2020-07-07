class Event < ApplicationRecord

  SELL_STATUS = [
    ['Selling', 1],
    ['SOLD', 1],
    ['In queue', 1],
  ]

  has_and_belongs_to_many :users

  validates :title, presence: true, length: {maximum: 32}
  validates :datetime, presence: true

  def initialize (title, money) # "Конструктор"
    @title = title
    @event_money = event_money.to_i
    @money_for_users = event_money / event.users.count
  end

  def sold!(event, user)
    if event.status != true
      event.users.each do |user|
        user.money.to_i += @money_for_users.to_i
      end
      event.update_attribute(:status, true)
    else
      event.users.each do |user|
        user.money.to_i -= @money_for_users.to_i
      end
      event.update_attribute(:status, false)
    end
  end

  def archive!
    self.archived = true
    save
  end
end
