class Size < ApplicationRecord
  belongs_to :listing
  has_many :reservations
  validates :size, :price, presence: true
end
