class Stockist < ApplicationRecord
  belongs_to :user
  has_many :addresses
  has_many :listings
  validates :business_name, :abn, presence: true, uniqueness: true
end
