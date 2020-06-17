class Event < ApplicationRecord

  validates :title, presence: true, length: {maximum: 32}
  validates :datetime, presence: true
end
