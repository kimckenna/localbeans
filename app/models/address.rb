class Address < ApplicationRecord
  belongs_to :stockist
  validates :address_line1, :state, presence: true
  validates :suburb, length: { maximum: 45 }, presence: true
  validates :postcode, length: { is: 4 }, numericality: { only_integer: true }, presence: true

  has_many :listings, through: :stockist

  enum state: ['ACT', 'NSW', 'NT', 'QLD', 'SA', 'TAS', 'VIC', 'WA']

  # include PgSearch::Model

  # pg_search_scope :search_by_suburb,
  #   against: [ :suburb, :postcode],
  #   associated_against: {
  #     listing: [ :stoc]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }

  #   pg_search_scope :tasty_search, associated_against: {
  #     cheeses: [:kind, :brand],
  #     cracker: :kind
  #   }
end
