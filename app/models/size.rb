class Size < ApplicationRecord
  belongs_to :listing
  has_many :reservations, dependent: :destroy
  validates :size, :price, presence: true
  scope :active, -> { where(active: TRUE)}
  validates_inclusion_of :active,:in => [true, false]
  def size_price
    "#{size}g  |  $#{price}0"
  end
  # before_create :set_active

  # def set_active
  #   self.active = true
  # end
end
