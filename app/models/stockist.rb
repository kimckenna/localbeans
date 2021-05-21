class Stockist < ApplicationRecord
  belongs_to :user
  has_many :addresses
  validates :business_name, :abn, presence: true, uniqueness: true
end
