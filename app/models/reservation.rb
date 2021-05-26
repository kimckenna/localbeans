class Reservation < ApplicationRecord
  belongs_to :size
  belongs_to :user
end
