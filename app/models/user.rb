class User < ApplicationRecord

  has_many :member

  require 'set'

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, confirmation: { case_sensitive: false }

end
