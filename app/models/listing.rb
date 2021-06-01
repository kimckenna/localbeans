class Listing < ApplicationRecord
  belongs_to :stockist
  belongs_to :brand
  has_many :sizes, dependent: :destroy
  has_many :listing_grinds, dependent: :destroy
  has_many :grinds, through: :listing_grinds, dependent: :destroy
  validates :name, :flavour_profile, :bean_type, presence: true
  validates_associated :sizes, :grinds, :brand
  accepts_nested_attributes_for :brand, :sizes, :listing_grinds

  enum bean_type: ['Single Origin', 'Mix Blend', 'Decaf']
end