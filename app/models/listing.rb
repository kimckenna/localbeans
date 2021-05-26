class Listing < ApplicationRecord
  belongs_to :stockist
  belongs_to :brand
  has_many :sizes
  validates :name, :flavour_profile, presence: true
  validates_associated :sizes
end