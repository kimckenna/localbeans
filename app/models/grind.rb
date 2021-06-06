class Grind < ApplicationRecord
  validates :bean_grind, presence: true
  has_many :listing_grinds, dependent: :destroy
  has_many :listings, through: :listing_grinds, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
