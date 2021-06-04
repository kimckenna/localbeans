class Address < ApplicationRecord
  belongs_to :stockist
  validates :address_line1, :state, presence: true
  validates :suburb, length: { maximum: 45 }, presence: true
  validates :postcode, length: { is: 4 }, numericality: { only_integer: true }, presence: true

  has_many :listings, through: :stockist

  enum state: ['ACT', 'NSW', 'NT', 'QLD', 'SA', 'TAS', 'VIC', 'WA']

  def stockist_address
    "#{address_line1.downcase.gsub(/[a-z']+/,&:capitalize)} #{address_line2.downcase.gsub(/[a-z']+/,&:capitalize)}, #{suburb.downcase.gsub(/[a-z']+/,&:capitalize)}, #{state.upcase}, #{postcode}"
  end
end
