class Listing < ApplicationRecord
  include PgSearch::Model
  belongs_to :stockist
  belongs_to :brand
  has_many :sizes, dependent: :destroy
  has_many :listing_grinds, dependent: :destroy
  has_many :grinds, through: :listing_grinds, dependent: :destroy
  has_many_attached :images
  validates :name, :flavour_profile, :bean_type, presence: true
  validates_associated :sizes, :grinds, :brand
  accepts_nested_attributes_for :brand, :sizes, :listing_grinds

  enum bean_type: ['Single Origin', 'Mix Blend', 'Decaf']

  scope :location, -> { where('stockist.addresses.first = ?, query')}
end