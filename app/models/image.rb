class Image < ApplicationRecord
  belongs_to :home_stay

  validates :url, presence: true
end
