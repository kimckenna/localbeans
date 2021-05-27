class Listing < ApplicationRecord
  belongs_to :stockist
  belongs_to :brand
  has_many :sizes
  validates :name, :flavour_profile, :bean_type, presence: true
  validates_associated :sizes, :grinds

  enum bean_type: ['Single Origin', 'Mix Blend', 'Decaf']
end