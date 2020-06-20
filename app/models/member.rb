class Member < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :event, presence: true

end
