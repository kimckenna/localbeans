class Brand < ApplicationRecord
	has_many :listings, dependent: :destroy
	validates :brand, presence: true, uniqueness: true
end
