class HomeStay < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :reservations

  validates :name, presence: true, length: { maximum: 250, minimum: 4 }
  validates :location, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :no_of_rooms, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, presence: true
  validates :user_id, presence: true
end
