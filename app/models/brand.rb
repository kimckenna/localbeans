class Brand < ApplicationRecord
	has_many :listings, dependent: :destroy
	has_many :stockist_brands, dependent: :destroy
  has_many :stockists, through: :stockist_brands, dependent: :destroy
	validates :brand, presence: true, uniqueness: true
	accepts_nested_attributes_for :stockist_brands
end
