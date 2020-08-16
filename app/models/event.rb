class Event < ApplicationRecord

  has_and_belongs_to_many :users

  validates :title, presence: true, length: {maximum: 32}
  validates :datetime, presence: true
  validates :event_money, length: {maximum: 12}

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

  def add_user_to_event(event, user_name_to_event)
    user_name_to_event = user_name_to_event.delete(" ?!:;.,()«»<>\"\-").downcase.titleize
    u1 = User.find_by name: user_name_to_event

    if u1 == nil? || user_name_to_event != ""
      if u1 == nil
        user = User.new
        user.name = user_name_to_event
        if user.valid?
          user.save!
          event.users << user
          "success_create_add"
        else
          "empty_field"
        end
      elsif User.exists?(:name => user_name_to_event) && ((event.users.find_by name: user_name_to_event) == nil)
        event.users << u1
        "success_added"
      else
        "already_was"
      end
    else
      "error_name"
    end
  end

end
