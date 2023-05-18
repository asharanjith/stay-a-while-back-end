class User < ApplicationRecord
  has_many :home_stays
  has_many :reservations
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }
end
