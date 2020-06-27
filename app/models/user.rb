class User < ApplicationRecord

  has_and_belongs_to_many :events

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, confirmation: { case_sensitive: false }

  def initialize (user_name, user_money) # "Конструктор"
    @user_name = user_name
    @user_money = user_money.to_i
  end

end
