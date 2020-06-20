class Event < ApplicationRecord

  has_many :member

  validates :title, presence: true, length: {maximum: 32}
  validates :datetime, presence: true

end
