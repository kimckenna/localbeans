class Size < ApplicationRecord
  belongs_to :listing
  has_many :reservations, dependent: :destroy
  validates :size, :price, :active, presence: true
  scope :active, -> { where(active: TRUE)}
end
