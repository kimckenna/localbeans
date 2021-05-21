class Address < ApplicationRecord
  belongs_to :stockist
  validates :address_line1, :suburb, :state, :postcode, presence: true
end
