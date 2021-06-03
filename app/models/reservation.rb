class Reservation < ApplicationRecord
  belongs_to :sizes
  belongs_to :user
  belongs_to :grinds
  #accepts_nested_attributes_for :sizes, :grinds
end
