class Address < ApplicationRecord
  belongs_to :stockist
  validates :address_line1, :state, presence: true
  validates :suburb, length: { maximum: 45 }, presence: true
  validates :postcode, length: { is: 4 }, numericality: { only_integer: true }, presence: true
end
