class Listing < ApplicationRecord
  belongs_to :stockist
  belongs_to :brand
  has_many :sizes
  validates :name, :flavour_profile, :bean_type, :bean_grind, presence: true
  validates_associated :sizes

  enum bean_type: ['Single Origin', 'Mix Blend', 'Decaf']
  enum bean_grind: ['Whole Beans', 'Espresso', 'Stove Top', 'Cold Brew', 'Batch Brew', 'Plunger', 'Pour Over', 'French Press', 'Aero Press', 'Reusable Pods', 'Turkish']
end