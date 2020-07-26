class Event < ApplicationRecord

  has_and_belongs_to_many :users

  validates :title, presence: true, length: {maximum: 32}
  validates :datetime, presence: true

  def sold!(event)
    if event.status == true
      event.users.each do |user|
        user.money += (event.event_money / event.users.count).to_i
      user.save!
      end
    else
      nil
    end
  end

  def self.add_user_to_event(event, user)
    Rails.logger.debug "KEK"
    Rails.logger.debug user.inspect
    event.users << user
  end

end
