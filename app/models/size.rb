class Size < ApplicationRecord
  belongs_to :listing
  has_many :reservations, dependent: :destroy
  validates :size, :price, presence: true
end
