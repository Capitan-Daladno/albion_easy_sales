class Event < ApplicationRecord

  SELL_STATUS = [
    ['Selling', 1],
    ['SOLD', 1],
    ['In queue', 1],
  ]

  has_and_belongs_to_many :users

  validates :title, presence: true, length: {maximum: 32}
  validates :datetime, presence: true

  def sold!(event)
    if event.status == true
      event.users.each do |user|
        user.money += (event.event_money / event.users.count).to_i
      user.save!
      end
    elsif event.status == false
      event.users.each do |user|
        user.money -= (event.event_money / event.users.count).to_i
        user.save!
      end
    end
  end
end
