class Stockist < ApplicationRecord
  belongs_to :user
  has_many :addresses, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :stockist_brands, dependent: :destroy
  has_many :brands, through: :stockist_brands, dependent: :destroy
  has_one :image
  validates :business_name, :abn, presence: true, uniqueness: true
  validates_associated :addresses
  accepts_nested_attributes_for :stockist_brands, :addresses
end
