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


  def add_user_to_event(event, u1, user_test_name)
    if u1 != nil && (event.users.find_by name: user_test_name) == u1
      "already_was"
    elsif (event.users.find_by name: u1) == nil && User.exists?(:name => user_test_name)
      event.users << u1
      "success_added"
    elsif u1 == nil && user_test_name != ""
      user = User.new
        user.name = user_test_name.delete(" ?!:;.,()«»<>\"\-").downcase.titleize
        if user.valid?
          user.save!
          event.users << user
          "success_create_add"
        else
          "error_name"
        end
    elsif user_test_name == ""
      "error_name"
    else
      "undefined_error"
    end
  end
end
