class User < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }
end
