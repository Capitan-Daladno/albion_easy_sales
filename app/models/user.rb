class User < ApplicationRecord

  has_and_belongs_to_many :events

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, confirmation: { case_sensitive: false }

  def give_out
    user.money == 0
    user.save!
  end

end
