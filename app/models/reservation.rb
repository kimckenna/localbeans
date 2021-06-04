class Reservation < ApplicationRecord
  belongs_to :size
  belongs_to :user
  belongs_to :grind
  #accepts_nested_attributes_for :sizes, :grinds
end
