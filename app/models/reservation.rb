class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :home_stay
end
