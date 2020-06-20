class Event < ApplicationRecord

  attr_accessor :users_count, :money_for_users

  belongs_to :users, optional: true

  validates :title, presence: true, length: {maximum: 32}
  validates :datetime, presence: true
  validates :user, presence: true

  def initialize (title, event_money) # "Конструктор"
    @title = title
    @event_money = event_money.to_i
  end

  def self.money_for_users (event_money)
    @money_for_users = event_money / User.count
  end


end
