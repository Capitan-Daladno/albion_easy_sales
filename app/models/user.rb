class User < ApplicationRecord

  require 'set'

  has_many :events

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, confirmation: { case_sensitive: false }


  attr_accessor :user_name, :user_money

  @@users = Set.new

  def initialize (user_name, user_money) # "Конструктор"
    @user_name = user_name
    @user_money = user_money.to_i

    @@users << self
  end

  def self.user_money
    @user_money.to_i
  end

  def self.count
    @@users.size
  end

end
