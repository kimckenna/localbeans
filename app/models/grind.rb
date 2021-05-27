class Grind < ApplicationRecord
  belongs_to :listing
  validates :bean_grind, presence: true
  has_many :reservations, dependent: :destroy

  enum bean_grind: ['Whole Beans', 'Espresso', 'Stove Top', 'Cold Brew', 'Batch Brew', 'Plunger', 'Pour Over', 'French Press', 'Aero Press', 'Reusable Pods', 'Turkish']
end
