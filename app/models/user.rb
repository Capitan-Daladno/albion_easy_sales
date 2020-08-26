class User < ApplicationRecord
  has_and_belongs_to_many :events
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def giveout(user)
    unless user.money <= 0
      user.money = 0
      save!
      user.save!
    end
  end
end
