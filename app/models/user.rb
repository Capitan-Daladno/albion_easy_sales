class User < ApplicationRecord

  validates: :name, presense: true
  validates: :name, uniqueness: true { case_sensitive: false }
end
