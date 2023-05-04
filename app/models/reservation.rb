class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :home_stay

  validates :no_of_persons, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
