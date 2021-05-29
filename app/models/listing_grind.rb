class ListingGrind < ApplicationRecord
  belongs_to :grind
  belongs_to :listing

  # accepts_nested_attributes_for :grinds
end
