class Size < ApplicationRecord
  belongs_to :listing
  has_many :reservations, dependent: :destroy
  validates :size, :price, :active, presence: true
  scope :active, -> { where(active: TRUE)}
  before_create :set_active

  def set_active
    self.active = true
  end
end
