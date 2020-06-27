class Event < ApplicationRecord

  has_and_belongs_to_many :users

  validates :title, presence: true, length: {maximum: 32}
  validates :datetime, presence: true

  def initialize (title, event_money) # "Конструктор"
    @title = title
    @event_money = event_money.to_i
    @money_for_users = event_money / User.count
  end

end
